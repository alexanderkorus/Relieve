//
//  GamesCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 15.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve

public final class GamesCoordinator: AbstractCoordinator, TabCoordinator {

    // MARK: - Delegate Properties
    private unowned let delegate: GamesCoordinatorDelegate

    // MARK: - TabCoordinator Properties
    public let tabBarItem: UITabBarItem = UITabBarItem(title: "Games", image: nil, selectedImage: nil)
    public typealias ViewController = UINavigationController

    // MARK: - Initializer
    public init(delegate: GamesCoordinatorDelegate, viewController: UINavigationController) {
        self.delegate = delegate
        self.viewController = viewController
        self.viewController.tabBarItem = self.tabBarItem
        super.init()
    }

    // MARK: - Stored Properties
    public let viewController: UINavigationController

    // MARK: - Computed Properties

    // MARK: - Instance Methods
    public override func start() {
        super.start()

        self.viewController.viewControllers = [
            GamesVC(delegate: self)
        ]

    }
}

extension GamesCoordinator: GamesVCDelegate {

}
