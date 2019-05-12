//
//  MainTabBarCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 12.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Relieve

class MainTabBarCoordinator: TabBarCoordinator {
    
    // MARK: Initializers
    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    // MARK: Stored Properties
    public let tabBarController: UITabBarController
    private var _childCoordinators: [Coordinator] = []

    // MARK: Coordinator Properties
    var tabs: [AnyTabCoordinator] = []
    var childCoordinators: [Coordinator] = []
    
    func add(childCoordinator coordinator: Coordinator) {
        self._childCoordinators.append(coordinator)
    }
    
    func remove(childCoordinator coordinator: Coordinator) {
        self._childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
    
    // MARK: Instance Methods
    func start() {
        
        // Defining the coordinators for the tabbar
        let teamCoordinator: TeamCoordinator = TeamCoordinator(
            navigationController: UINavigationController()
        )
        
        // add the coordinators to an array
        let coordinators: [Coordinator] = [
            teamCoordinator
        ]
        
        // get unified tab coordinators into array
        let tabCoordinators: [AnyTabCoordinator] = self.degenericize([
            teamCoordinator
        ])
        
        // extracts viewcontrollers from tab coordinators
        let vcs: [UIViewController] = tabCoordinators.map { $0.viewController }
        
        // start all coordinators of the tab
        coordinators.forEach { [unowned self] (coordinator: Coordinator) -> Void in
            coordinator.start()
            self._childCoordinators.append(coordinator)
        }
        
        // set the view controllers to tabBarController
        self.tabBarController.setViewControllers(vcs, animated: false)
        self.tabBarController.tabBar.barTintColor = .red
        self.tabBarController.tabBar.tintColor = .white
        
    }
    
    
    
    
    
}
