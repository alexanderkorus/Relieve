//
//  UIImage+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 14.06.19.
//

import Foundation


public extension UIImage {
    
    static func `for`(name: String) -> UIImage? {
        
        if let image = UIImage(named: name) {
            return image
        } else {
            return nil
        }
        
    }
    
}
