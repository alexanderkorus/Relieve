//
//  ScopeFunc.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

/**
 Protocol for kotlin like scope functions
 */
public protocol ScopeFunctions {}

/**
 Protocol extension for kotlin like scope functions
 */
public extension ScopeFunctions {
    
    /**
    Kotlin like apply function. Applies changes to the given type instance
    */
    @discardableResult @inline(__always) func apply(block: (Self) -> ()) -> Self {
        block(self)
        return self
    }
    
    /**
    Kotlin like let function. Check for null
    */
    @discardableResult @inline(__always) func `let`<R>(block: (Self) -> R) -> R {
        return block(self)
    }
    
}

extension NSObject: ScopeFunctions {}
extension String: ScopeFunctions {}
extension Date: ScopeFunctions {}
extension Bool: ScopeFunctions {}
extension Float: ScopeFunctions {}
extension Double: ScopeFunctions {}
extension CGFloat: ScopeFunctions {}
extension Int: ScopeFunctions {}
extension Int8: ScopeFunctions {}
extension Int16: ScopeFunctions {}
extension Int32: ScopeFunctions {}
extension Int64: ScopeFunctions {}
extension Array: ScopeFunctions {}
extension URL: ScopeFunctions {}



