//
//  TabCoordinator.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//

import class UIKit.UIViewController
import class UIKit.UITabBarItem

public protocol TabCoordinator: Coordinator {
    
    /**
     UIViewController type to be managed by TabCoordinator
     */
    associatedtype ViewController: UIViewController
    
    /**
     UIViewController instance being managed
     */
    var viewController: ViewController { get }
    
    /**
     UITabBarItem for the UIViewController
     */
    var tabBarItem: UITabBarItem { get }
}
