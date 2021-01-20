//
//  Array+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

import Foundation
import CoreLocation

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

	/// Returns an array, up to the specified maximum length, containing the initial elements of the collection.
	/// - Parameter maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero.
	/// - Returns: An array starting at the beginning of this collection with at most maxLength elements.
	func limit(_ maxLength: Int) -> Array {
		return Array(self.prefix(maxLength))
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

public extension Array where Element == CLLocation {

	/// Returns an new sorted array of the locations sorted by distance to the passed location
	/// - Parameter location: location to which the array should be sorted
	/// - Returns: an new sorted array of the objects sorted by distance to the passed location
	func sortedByDistance(to location: CLLocation) -> [CLLocation] {
		return sorted(by: { location.distance(from: $0) < location.distance(from: $1) })
	}
}
