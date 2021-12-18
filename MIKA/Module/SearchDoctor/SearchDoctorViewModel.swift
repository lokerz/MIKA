//
//  SearchDoctorViewModel.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

class SearchDoctorViewModel {
    private var view : SearchDoctorViewControllerProtocol?
    private var doctorList : [Doctor]?
    
    convenience init(view: SearchDoctorViewControllerProtocol) {
        self.init()
        self.view = view
    }
    
    private func requestFetchList(for key: String) {
        SearchDoctorService.shared.getDoctorList(responseType: [Doctor].self, completion:  { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.processList(response)
                case .failure(let error):
                    break
                }
            }
        })
    }
    private func processList(_ list: [Doctor]?) {
        doctorList = list
        view?.refreshData()
    }
}

extension SearchDoctorViewModel: SearchDoctorViewModelProtocol {
    func fetchDoctorList(key: String) {
        requestFetchList(for: key)
    }
    
    func getDoctorList() -> [Doctor] {
        guard let list = doctorList else { return [] }
        return list
            
    }
    
    
}
