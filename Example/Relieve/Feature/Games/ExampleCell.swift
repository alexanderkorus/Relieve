//
//  ExampleCell.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 15.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve

public final class ExampleCell: UITableViewCell, RelieveTableViewCell {

    // MARK: - Subviews

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Setting up subviews
        self.rl.subviews(forAutoLayout: [])

        // Setting up Constraints

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public static var Identifier: String = "ExampleCellIdentifier"

}
