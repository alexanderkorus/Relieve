//
//  RoundImageView.swift
//  Relieve
//
//  Created by Alexander Korus on 27.06.19.
//

import UIKit

open class RoundImageView: UIImageView {
    
    override open func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.size.width / 2.0
        self.clipsToBounds = true
    }
    
}
