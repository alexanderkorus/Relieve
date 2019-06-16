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
            debugPrint("Parsing Error in: \(Self.self) with message: \(error)")
            return nil
        }
    }
    
}

public extension Array where Element: Decodable {
    
    static func from(data: Data, with decoder: JSONDecoder = JSONDecoder()) -> [Element]? {
        do {
            return try decoder.decode([Element].self, from: data)
        } catch let error {
            debugPrint("Parsing Error in: \([Element].self) with message: \(error)")
            return nil
        }
    }
    
}

extension String: CodingKey {
    
    public var stringValue: String {
        return self
    }
    
    public init?(stringValue: String) {
        self.init(stringLiteral: stringValue)
    }
    
    public var intValue: Int? {
        return nil
    }
    
    public init?(intValue: Int) {
        return nil
    }
    
}

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
    
    static let iso8601noFS: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter
    }()
}
