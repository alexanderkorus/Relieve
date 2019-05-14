//
//  TeamCell.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 14.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import Relieve
import SnapKit

class TeamCell: UITableViewCell, RelieveTableViewCell {
    
    // MARK: Subviews
    let teamImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    let teamNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setting up subviews
        self.rl.subviews(forAutoLayout: [self.teamImageView, self.teamNameLabel])
        
        // Setting up Constraints
        self.teamImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-10)
            $0.aspectRatio(1, by: 1, self.teamImageView)
        }
        
        self.teamNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(self.teamImageView.snp.trailing).offset(15)
            $0.bottom.equalToSuperview().offset(-10)
            $0.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var Identifier: String = "TeamCellIdentifier"
    
}
