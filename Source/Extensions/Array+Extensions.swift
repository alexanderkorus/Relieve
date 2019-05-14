//
//  Array+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

import Foundation

public extension Array {
    
    /**
    This function filter an array based on properties
    */
    func filterDuplicates(includeElement: @escaping (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element] {
        var results = [Element]()
        
        forEach { (element) in
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }
        
        return results
    }
    
}

public extension Array where Element:Equatable {
    
    /**
    Returns an array without duplicate values
    */
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
    
}
