//
//  TeamDetailCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 21.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve

public final class TeamDetailCoordinator: AbstractCoordinator {

    // MARK: - Delegate Properties
    private let delegate: TeamDetailCoordinatorDelegate?
    

    // MARK: - Initializer
    public init(delegate: TeamDetailCoordinatorDelegate? = nil, team: Team, viewController: UINavigationController) {
        self.delegate = delegate
        self.viewController = viewController
        self.team = team
        super.init()
    }

    // MARK: - Stored Properties
    private let viewController: UINavigationController
    private let team: Team

    // MARK: - Computed Properties

    // MARK: - Instance Methods
    public override func start() {
        super.start()

        self.viewController.pushViewController(TeamDetailVC(delegate: self, team: team), animated: true)

    }
}

extension TeamDetailCoordinator: TeamDetailVCDelegate {

}
