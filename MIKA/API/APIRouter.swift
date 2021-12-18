//
//  APIRouter.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

enum APIRouter {
    case MockDoctorList
    
    var path: String {
        let path = APIConstant.Path.self
        
        switch self {
        case .MockDoctorList : return path.mockAPI
        }
    }
}


extension URL {
    static func construct(_ endpoint: APIRouter, queries: [String: Any] = [:]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = APIConstant.URL.base
        components.path = "/" + endpoint.path
        components.queryItems = queries.isEmpty ? nil : queries
            .compactMapValues({
                if let value = $0 as? String {
                    return value
                } else {
                    return "\($0)"
                }
            })
            .map({ URLQueryItem(name: $0.key, value: $0.value) })
        return components.url
    }
}
