//
//  FilterViewModel.swift
//  MIKA
//
//  Created by Ridwan on 19/12/21.
//

import Foundation
import UIKit

class FilterViewModel {
    private var view : FilterViewControllerProtocol?
    private var filterType : Constant.Filter.Category
    private var filterArr = [String]()
    private var selectedArr = [String]()
    private var onSuccessAction: (([String]) -> Void)?
    
    init(view: FilterViewControllerProtocol, type: Constant.Filter.Category, arr: [String]?, action: (([String]) -> Void)? ) {
        self.view = view
        self.filterType = type
        self.onSuccessAction = action
        self.filterArr = filterType == .Hospital ? Constant.Filter.Hospital : Constant.Filter.Specialization
        self.selectedArr = arr ?? []
    }
    private func updateFilter(at index: IndexPath){
        guard filterArr.count > index.row else {return}
        let item = filterArr[index.row]
        if !selectedArr.contains(item) {
            selectedArr.append(item)
        } else {
            selectedArr.removeAll { $0 == item }
        }
        view?.refreshTable()
    }
}

extension FilterViewModel: FilterViewModelProtocol {
    var filters : [String] {
        return filterArr
    }
    var selectedFilters: [String] {
        return selectedArr
    }
    func doSave() {
        onSuccessAction?(selectedArr)
    }
    func selectItem(at index: IndexPath) {
        updateFilter(at: index)
    }
}
