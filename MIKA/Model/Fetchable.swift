//
//  FetchModel.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

protocol Fetchable {
    func parameters() -> [String : Any]
}
