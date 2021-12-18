//
//  SearchDoctorService.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

class SearchDoctorService {
    static var shared = SearchDoctorService()
    
    func getDoctorList<T: Decodable>(responseType: T.Type, completion: @escaping (APIResult<T?>) -> Void) {
        APIService.shared.request(.get, .MockDoctorList, responseType: responseType) { result in
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
