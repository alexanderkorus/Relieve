//
//  AppCoordinator.swift
//  Relieve
//
//  Created by Alexander Korus on 12.05.19.
//

import class UIKit.UIWindow
import class UIKit.UIViewController

/**
 The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
 the AppDelegate, kick off the start of the application, and set up any configurations for the entire application.
 
 How to implement:
 Create an AppCoordinator child class and implement the start() method
 Create a lazy variable in AppDelegate to initialize the coordinator, and pass the window and the root controller to the
 instance:
 ```
    public var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
 
    lazy var relieveExampleAppCoordinator: AppCoordinator = RelieveExampleAppCoordinator(
        window: self.window!,
        rootViewController: UINavigationController()
    )
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        relieveExampleAppCoordinator.start()
        return true
    }
 ```
 */
open class AppCoordinator<RootViewController: UIViewController>: AbstractCoordinator {
    
    /**
     The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
     the AppDelegate, kick off the start of the application, and set up any configurations for the entire application.
     - parameter window: The UIWindow instance managed by the AppCoordinator. Taken from the AppDelegate.
     - parameter rootViewController: The UIViewController instance that is the rootViewController of the UIWindow.
     */
    public init(window: UIWindow, rootViewController: RootViewController) {
        self.window = window
        self.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
        super.init()
    }
    
    /**
     The UIWindow instance the AppCoordinator manages. Typically the AppDelegate's UIWindow instance
     */
    public let window: UIWindow
    
    /**
     The UIWindow instance's rootViewController
     */
    public var rootViewController: RootViewController {
        didSet {
            self.window.rootViewController = self.rootViewController
            self.window.makeKeyAndVisible()
        }
    }
}
