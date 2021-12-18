//
//  SearchDoctorService.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

class SearchDoctorService {
    static var shared = SearchDoctorService()
    
    func getDoctorList<J: Fetchable, T: Decodable>(fetchModel: J, responseType: T.Type, completion: @escaping (APIResult<T>) -> Void) {
        let param = fetchModel.parameters()
        APIService.shared.request(.get, .MockDoctorList, parameters: param, responseType: responseType) { result in
            switch result {
            case .success(let response):
                guard response.status, let data = response.data else {return}
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
