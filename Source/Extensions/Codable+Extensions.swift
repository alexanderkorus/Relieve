//
//  Codable+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 15.06.19.
//

import Foundation

extension Encodable {
    
    
    
}

extension Decodable {
    
    static func from<T: Decodable>(data: Data, decoder: JSONDecoder = JSONDecoder()) -> T? {
        do {
            return try decoder.decode(T.self, from: data)
        } catch let error {
            print("Parsing Error in: \(T.self) with message: \(error.localizedDescription)")
            return nil
        }
    }
}
