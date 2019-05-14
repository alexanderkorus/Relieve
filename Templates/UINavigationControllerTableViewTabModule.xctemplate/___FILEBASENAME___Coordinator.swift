//___FILEHEADER___

import UIKit
import Relieve

public final class ___FILEBASENAMEASIDENTIFIER___: AbstractCoordinator, TabCoordinator {

    // MARK: - Delegate Properties
    private unowned let delegate: ___VARIABLE_productName:identifier___CoordinatorDelegate

    // MARK: - TabCoordinator Properties
    public let tabBarItem: UITabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
    public typealias ViewController = UINavigationController

    // MARK: - Initializer
    public init(delegate: ___VARIABLE_productName:identifier___CoordinatorDelegate, viewController: UINavigationController) {
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
            ___VARIABLE_productName:identifier___VC(delegate: self)
        ]

    }
}

extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName:identifier___VCDelegate {

}
