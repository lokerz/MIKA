//
//  UIImage.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFromURL(url: String?){
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: url ?? ""), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
