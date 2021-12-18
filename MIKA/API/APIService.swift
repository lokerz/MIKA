//
//  APIService.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation
import UIKit

public typealias APIResult<T: Decodable> = Result<T, Error>

final class APIService {
    static var shared = APIService()

    // GENERAL FUNCTION
    func request<T: Decodable>(_ method: APIResponse.Method = .get, _ endpoint: APIRouter, headers: [String: String] = [:], parameters: [String: Any] = [:], responseType: T.Type, completion: @escaping (_ result: Result<APIResponse.Response<T>, Error>) -> Void) {

        let defaultHeaders: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        guard let url = URL.construct(endpoint) else {
            fatalError("Invalid URL, please check `NetworkingEndpoint`")
        }

        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 60)
        request.allHTTPHeaderFields = defaultHeaders.merging(headers) { (_, value) in value }
        request.httpMethod = method.rawValue.uppercased()

        if method != .get {
            // Non GET method
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } else {
            // GET method
            request.url = URL.construct(endpoint, queries: parameters)
        }

        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                return
            }

            let url = request.url?.absoluteString ?? ""
            var logOutput = "🚀 HTTP_REQUEST: \(method.rawValue) \(url)"
            if method != .get {
                logOutput += " 📦 BODY: \(parameters.debugDescription)"
            }
            if let responseJSON = String(data: data, encoding: .utf8) {
                logOutput += " ✅ JSON: \(responseJSON)"
            }
            print(logOutput)

            do {
                let result = try JSONDecoder().decode(APIResponse.Response<T>.self, from: data)
                completion(.success(result))
            } catch let error {
                completion(.failure(error))
            }
        })

        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        task.resume()
    }
    
}
