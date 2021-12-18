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
    private var specialization : [String]?
    private var hospital : [String]?
    
    convenience init(view: SearchDoctorViewControllerProtocol) {
        self.init()
        self.view = view
    }
    
    private func requestFetchList(for model: FetchDoctor) {
        SearchDoctorService.shared.getDoctorList(fetchModel: model, completion:  { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.processList(response)
                case .failure(let error):
                    self?.view?.showError(error.localizedDescription)
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
    func fetchDoctorList(for model: FetchDoctor) {
        requestFetchList(for: model)
    }
    
    func getDoctorList() -> [Doctor] {
        guard let list = doctorList else { return [] }
        return list
    }
    
    func getHospital() -> [String]? {
        return hospital
    }
    
    func getSpecialization() -> [String]? {
        return specialization
    }
    
    func setFilter(hospital: [String], specialization: [String]) {
        self.hospital = hospital
        self.specialization = specialization
    }
    
}
