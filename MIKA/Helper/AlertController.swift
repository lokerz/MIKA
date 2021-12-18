//
//  AlertController.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

protocol AlertController: BaseUIViewController {

}

extension AlertController {
    func showLoading(_ message: String? = nil) {
        DispatchQueue.main.async {
            
        }
    }
    
    func showError(_ message: String? = nil) {
        DispatchQueue.main.async {
            
        }
    }
    
    func showSuccess(_ message: String? = nil) {
        DispatchQueue.main.async {
            
        }
    }

    func dismissAlert() {
        DispatchQueue.main.async {
            
        }
    }
}
