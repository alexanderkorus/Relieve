//
//  MapCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 27.06.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Relieve

final class MapCoordinator: AbstractCoordinator, TabCoordinator {

    // MARK: - Delegate Properties
    private let delegate: MapCoordinatorDelegate

    // MARK: - TabCoordinator Properties
    public let tabBarItem: UITabBarItem = UITabBarItem(title: "Map", image: nil, selectedImage: nil)
    public typealias ViewController = UINavigationController

    // MARK: - Initializer
    init(delegate: MapCoordinatorDelegate, viewController: UINavigationController) {
        self.delegate = delegate
        self.viewController = viewController
        self.viewController.tabBarItem = self.tabBarItem
        super.init()
    }

    // MARK: - Stored Properties
    public let viewController: UINavigationController

    // MARK: - Computed Properties

    // MARK: - Instance Methods
    override func start() {
        super.start()

        self.viewController.viewControllers = [
            MapVC(delegate: self)
        ]

    }
}

extension MapCoordinator: MapVCDelegate {

}
