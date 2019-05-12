//
//  UIView+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//

import class UIKit.UIView
import struct CoreGraphics.CGFloat

/**
 A DSL for UIView to access custom methods
 */
public struct RelieveViewDSL {
    
    // MARK: Stored Propeties
    /**
     Underlying UIView instance
     */
    public let view: UIView
    
}

public extension RelieveViewDSL {
    
    /**
     Adds subview and sets translatesAutoresizingMaskIntoConstraints to false.
     - parameter subview: The subview to add and prepare for AutoLayout.
     */
    func subview(forAutoLayout subview: UIView) {
        self.view.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }
    
    /**
     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.
     - parameter subviews: The subviews to add and prepare for AutoLayout.
     */
    func subviews(forAutoLayout subviews: UIView...) {
        self.subviews(forAutoLayout: subviews)
    }
    
    /**
     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.
     - parameter subviews: The subviews to add and prepare for AutoLayout.
     */
    func subviews(forAutoLayout subviews: [UIView]) {
        subviews.forEach(self.subview)
    }
    
}

public extension UIView {
    /**
     KioViewDSL instance to access custom methods
     */
    var rl: RelieveViewDSL {
        return RelieveViewDSL(view: self)
    }
}
