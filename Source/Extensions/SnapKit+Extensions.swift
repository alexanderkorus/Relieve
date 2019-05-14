//
//  SnapKit+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

import SnapKit

extension ConstraintMaker {
    
    /**
    Setup the aspect ratio to a view
    */
    public func aspectRatio(_ x: Double, by y: Double, _ instance: ConstraintView) {
        self.width.equalTo(instance.snp.height).multipliedBy(x / y)
    }
    
    /**
     Setup the aspect ratio to a view with priority
     */
    public func aspectRatio(_ x: Double, by y: Double, _ instance: ConstraintView, priority: Int) {
        self.width.equalTo(instance.snp.height).multipliedBy(x / y).priority(priority)
    }
}
