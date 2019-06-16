//
//  UIColor+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 16.06.19.
//

import Foundation
/**
 A DSL for UIColor to access custom methods
 */
public struct RelieveColorDSL {
    
    // MARK: Instance Methods
    /**
     Convenience method for UIColor with an alpha of 1.0
     - parameter red: red value for UIColor
     - parameter green: green value for UIColor
     - parameter blue: blue value for UIColor
     */
    public func color(red: UInt8, green: UInt8, blue: UInt8, alpha: CGFloat = 1.0) -> UIColor {
        let red: CGFloat = CGFloat(red) / 255.0
        let green: CGFloat = CGFloat(green) / 255.0
        let blue: CGFloat = CGFloat(blue) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     Convenience method for UIColor with an alpha of 1.0.
     If the string contains less than 6 characters (excluding the '#'), this method will return UIColor.black
     - parameter hexValue: Hex string value such as #FFFFFF
     */
    public func color(hexValue: String) -> UIColor {
        var hexValue: String = hexValue.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        if hexValue.count != 6 {
            return UIColor.black
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: hexValue).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
    
}

public extension UIColor {
    
    /**
     RelieveColorDSL instance to access custom methods
     */
    static var rl: RelieveColorDSL {
        return RelieveColorDSL()
    }
    
}
