//
//  ModuleBuilder.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

struct ModuleBuilder {
    struct Create {
        static func SearchDoctor() -> SearchDoctorViewController {
            let view = SearchDoctorViewController()
            let viewModel = SearchDoctorViewModel(view: view)
            view.viewModel = viewModel
            return view
        }
        
        static func Filter(type: Constant.Filter.Category, current: [String]?, onApply: (([String])-> Void)?) -> FilterViewController {
            let view = FilterViewController()
            let viewModel = FilterViewModel(view: view, type: type, arr: current, action: onApply)
            view.viewModel = viewModel
            return view
        }
    }
}
