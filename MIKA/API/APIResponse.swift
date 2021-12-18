//
//  APIResponse.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation

final class APIResponse {


    struct Response<T: Decodable>: Decodable {
        var status: Bool
        var data: T?
        var message: String?

        enum CodingKeys: String, CodingKey {
            case status, data, message
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.status = try container.decodeIfPresent(Bool.self, forKey: .status) ?? false
            self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
            self.data = try container.decodeIfPresent(T.self, forKey: .data)
        }
    }

    enum Method: String {
        case get, post, patch, put, delete
    }
}
