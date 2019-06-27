//___FILEHEADER___

import UIKit
import Relieve

final class ___FILEBASENAMEASIDENTIFIER___: TabBarCoordinator {

    // MARK: Initializers
    init(tabBarController: UITabBarController) {
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
        /*
        let __Coordinator: __Coordinator = __Coordinator(
            navigationController: UINavigationController()
        )
        */

        // add the coordinators to an array
        let coordinators: [Coordinator] = [
            /*__Coordinator*/
        ]

        // get unified tab coordinators into array
        let tabCoordinators: [AnyTabCoordinator] = [
          /*self.degenericize(coordinator)*/
        ]

        // extracts viewcontrollers from tab coordinators
        let vcs: [UIViewController] = tabCoordinators.map { $0.viewController }

        // start all coordinators of the tab
        coordinators.forEach { [unowned self] (coordinator: Coordinator) -> Void in
            coordinator.start()
            self._childCoordinators.append(coordinator)
        }

        // set the view controllers to tabBarController
        self.tabBarController.setViewControllers(vcs, animated: false)

        // tab bar appearance configuration
        self.tabBarController.tabBar.barTintColor = .white
        self.tabBarController.tabBar.tintColor = .black

    }
}
