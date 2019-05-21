//
//  TeamDetailView.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 21.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import Relieve

public final class TeamDetailView: UIView {

    // MARK: Subviews

    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white

        // Setting up subviews
        self.rl.subviews(forAutoLayout: [])

        // Setting up constraints
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
