//___FILEHEADER___

import UIKit
import Relieve

final class ___FILEBASENAMEASIDENTIFIER___: AbstractCoordinator, TabCoordinator {

    // MARK: - TabCoordinator Properties
    public let tabBarItem: UITabBarItem = UITabBarItem(
        title: "",
        image: UIImage(systemName: "list.dash"),
        tag: 0
    )

    public typealias ViewController = UINavigationController

    // MARK: - Stored properties
    public let viewController: UINavigationController = UINavigationController()


    // MARK: - Initializer
    override init() {
        self.viewController.tabBarItem = self.tabBarItem
        super.init()
    }

    // MARK: - Instance Methods
    override func start() {
        super.start()

        self.viewController.viewControllers = [
            ___VARIABLE_productName:identifier___VC(delegate: self)
        ]

    }
}

extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName:identifier___VCDelegate {

}
