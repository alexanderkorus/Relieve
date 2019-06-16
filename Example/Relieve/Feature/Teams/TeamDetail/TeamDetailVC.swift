//
//  TeamDetailVC.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 21.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve
import RxSwift
import RxCocoa

public final class TeamDetailVC: UIViewController {

    // MARK: Delegate Properties
    private unowned let delegate: TeamDetailVCDelegate

    // MARK: Initializers
    public init(delegate: TeamDetailVCDelegate, team: Team) {
        self.delegate = delegate
        self.team = team
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Lifecycle Methods
    public override func loadView() {
        self.view = TeamDetailView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationBar(visibilty: true, title: "", backgroundColor: UIColor(hex: "#7FB1EA"))

        self.setUpTapRecognizer(with: [:])

        self.setUpTargetActions(with: [:])

    }

    // MARK: Overridden UIKit Methods

    // MARK: Stored Properties
    private let disposeBag = DisposeBag()
    private let team: Team

    // MARK: Computed Properties

    // MARK: Instance Methods

}

// MARK: - Views
private extension TeamDetailVC {
    unowned var rootView: TeamDetailView { return self.view as! TeamDetailView }
}

// MARK: - Target Action Functions
private extension TeamDetailVC {

}
