//
//  UITableViewCell.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation
import UIKit

extension UITableViewCell {
    func nib() -> UINib {
        return UINib(nibName: self.nibName(), bundle: nil)
    }
    
    func nibName() -> String {
        return String(describing: type(of: self))
    }
}
