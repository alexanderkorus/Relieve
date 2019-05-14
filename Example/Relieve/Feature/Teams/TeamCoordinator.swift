//
//  TeamCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 13.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Relieve

class TeamCoordinator: AbstractCoordinator, TabCoordinator {
    
    // MARK: TabCoordinator Properties
    var viewController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(title: "Teams", image: nil, selectedImage: nil)
    typealias ViewController = UINavigationController
    
    // MARK: Initializer
    init(navigationController: UINavigationController) {
        self.viewController = navigationController
        self.viewController.tabBarItem = self.tabBarItem
        super.init()
    }
    
    // MARK: Instance Methods
    override func start() {
        super.start()
        
        
        
        
        
        
        self.viewController.viewControllers = [
            TeamVC(delegate: self)
        ]
    }
    
}

// MARK: - TeamVC Delegate Methods
extension TeamCoordinator: TeamVCDelegate {
    
    func refresh() {
        print("Refresh")
    }
    
}
