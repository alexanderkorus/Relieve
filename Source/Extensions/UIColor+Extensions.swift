//
//  UIColor+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 16.06.19.
//

import Foundation

public extension UIColor {
    
    /**
    Simple extension to UIColor that lets you create colors from hex strings. The method is a failable initializer,
    which means it returns nil if you don't specify a color in the correct format. It should be a # symbol, followed
    by red, green, blue and alpha in hex format, for a total of nine characters.
    */
    convenience init(hexValue: String) {
        var hexValue: String = hexValue.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        if hexValue.count != 6 {
            self.init(red: 255/255,
                      green: 255/255,
                      blue: 255/255,
                      alpha: 1.0
            )
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: hexValue).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
    
    convenience init(r: UInt8, g: UInt8, b: UInt8, a: CGFloat = 1.0) {
        let red: CGFloat = CGFloat(r) / 255.0
        let green: CGFloat = CGFloat(g) / 255.0
        let blue: CGFloat = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
}
