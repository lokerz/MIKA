//
//  SearchDoctorService.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

class SearchDoctorService {
    static var shared = SearchDoctorService()
    
    func getDoctorList(_ fetchModel: FetchDoctor, completion: @escaping (APIResult<[Doctor]>) -> Void) {
        APIService.shared.request(.get, .MockDoctorList, fetchModel, [Doctor].self) { result in
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
