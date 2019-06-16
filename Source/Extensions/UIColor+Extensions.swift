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
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
    
    convenience init(red: UInt8, green: UInt8, blue: UInt8, alpha: CGFloat = 1.0) {
        let red: CGFloat = CGFloat(red) / 255.0
        let green: CGFloat = CGFloat(green) / 255.0
        let blue: CGFloat = CGFloat(blue) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
