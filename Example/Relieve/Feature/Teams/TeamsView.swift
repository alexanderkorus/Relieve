//
//  TeamView.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 13.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Relieve
import SnapKit

class TeamsView: UIView {
    
    // MARK: - Subviews
    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        return tableView
    }()
    
    let refreshControl: UIRefreshControl = {
        let view: UIRefreshControl = UIRefreshControl()
        view.tintColor = .red
        return view
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        // Setting up subviews
        self.tableView.refreshControl = self.refreshControl
        
        self.rl.subviews(forAutoLayout: [
            self.tableView
        ])
        
        // Setting up constraints
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
