//
//  FilterModel.swift
//  MIKA
//
//  Created by Ridwan on 19/12/21.
//

import Foundation

protocol FilterViewModelProtocol {
    var filters : [String] {get}
    var selectedFilters : [String] {get}
    func doSave()
    func selectItem(at index: IndexPath)
}

protocol FilterViewControllerProtocol {
    func refreshTable()
}
