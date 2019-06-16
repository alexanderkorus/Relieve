//
//  RelieveExampleAppCoordinator.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 12.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Relieve

class RelieveExampleAppCoordinator: AppCoordinator<UITabBarController> {
    
    override func start() {
        super.start()
        
        //self.rootViewController = UITabBarController()
        
        let mainTabBarCoordinator: MainTabBarCoordinator = MainTabBarCoordinator(
            tabBarController: self.rootViewController
        )
        
        mainTabBarCoordinator.start()
        self.add(childCoordinator: mainTabBarCoordinator)
        
    }
    
    
}
