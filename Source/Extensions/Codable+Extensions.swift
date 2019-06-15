//
//  Codable+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 15.06.19.
//

import Foundation

public extension Encodable {
    
    
    
}

public extension Decodable {
    
    static func from<T: Decodable>(data: Data, ofType type: T.Type, with decoder: JSONDecoder = JSONDecoder()) -> T? {
        do {
            return try decoder.decode(type, from: data)
        } catch let error {
            print("Parsing Error in: \(type) with message: \(error.localizedDescription)")
            return nil
        }
    }
}
