//
//  GamesView.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 15.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import Relieve

public final class GamesView: UIView {

    // MARK: Subviews
    let tableView: UITableView = {
        let tableView: UITableView = UITableView()
        return tableView
    }()

    let refreshControl: UIRefreshControl = {
        let view: UIRefreshControl = UIRefreshControl()
        return view
    }()

    // MARK: Initializers
    public override init(frame: CGRect) {
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

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
