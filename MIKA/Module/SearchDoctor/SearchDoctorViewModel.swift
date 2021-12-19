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
    private var specialization = [String]()
    private var hospital = [String]()
    
    convenience init(view: SearchDoctorViewControllerProtocol) {
        self.init()
        self.view = view
    }
    
    private func requestFetchList(for name: String) {
        self.view?.showLoading(true)
        let model = FetchDoctor(name: name,
                                specialization: self.specialization,
                                hospital: self.hospital)
        SearchDoctorService.shared.getDoctorList(model, completion:  { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.showLoading(false)
                switch result {
                case .success(let response):
                    self?.processList(response)
                case .failure(let error):
                    self?.view?.setEmptyView(false)
                    break
                }
            }
        })
    }
    private func processList(_ list: [Doctor]?) {
        guard let list_ = list else {return}
        doctorList = filterList(list_)
        view?.refreshData()
        if let count = list?.count {
            view?.setEmptyView(count > 0)
        }
    }
    private func openFilter(_ type: Constant.Filter.Category){
        let arr = type == .Hospital ? hospital : specialization
        let filter = ModuleBuilder.Create.Filter(type: type, current: arr) { array in
            self.setFilter(type: type, array: array)
        }
        self.view?.navigateTo(filter, mode: .presentAsSheet)
    }
    private func setFilter(type: Constant.Filter.Category, array: [String]){
        switch type {
        case .Hospital: hospital = array
        case .Specialization: specialization = array
        }
    }
}

extension SearchDoctorViewModel: SearchDoctorViewModelProtocol {
    var doctors : [Doctor]?{
        return doctorList
    }
    func doSearch(_ name: String) {
        requestFetchList(for: name)
    }
    func doHospital() {
        openFilter(.Hospital)
    }
    func doSpecialization() {
        openFilter(.Specialization)
    }
}

extension SearchDoctorViewModel {
    //Extension for Filtering List Offline
    func filterList(_ doctors : [Doctor]) -> [Doctor] {
        var tempDoctor = [Doctor]()
        var tempFilterS = [String]()
        var tempFilterH = [String]()
        let filterName = view?.getName()
        
        tempFilterS.append(contentsOf: specialization.isEmpty ? Constant.Filter.Specialization : specialization)
        tempFilterH.append(contentsOf: hospital.isEmpty ? Constant.Filter.Hospital : hospital)
        
        //Filter by Hospital
        for doctor in doctors {
            if let hospitals = doctor.hospital {
                for hospital in hospitals {
                    if let name = hospital.name, tempFilterH.contains(name) {
                        tempDoctor.append(doctor)
                        break
                    }
                }
            }
        }
        //Filter by Specialization
        tempDoctor.removeAll(where: {
            if let specialization = $0.overview {
                return !tempFilterS.contains(specialization)
            }
            return false
        })
        //Filter by Name
        if filterName != "" {
            tempDoctor.removeAll(where: {
                if let name1 = $0.name?.lowercased(), let name2 = filterName?.lowercased() {
                    return !name1.contains(name2)
                }
                return false
            })
        }
        return tempDoctor
    }
}
