//
//  Codable+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 15.06.19.
//

import Foundation

public protocol RelieveDecodable {}

public extension RelieveDecodable where Self: Decodable {

    static func from(data: Data, with decoder: JSONDecoder = JSONDecoder()) -> Self? {
        do {
            return try decoder.decode(Self.self, from: data)
        } catch let error {
            print("Parsing Error in: \(Self.self) with message: \(error.localizedDescription)")
            return nil
        }
    }
    
}

public extension Array where Element: Decodable {
    
    static func from(data: Data, with decoder: JSONDecoder = JSONDecoder()) -> [Element]? {
        do {
            return try decoder.decode([Element].self, from: data)
        } catch let error {
            print("Parsing Error in: \([Element].self) with message: \(error.localizedDescription)")
            return nil
        }
    }
    
}
