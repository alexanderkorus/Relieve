//___FILEHEADER___

import UIKit
import Relieve

public final class ___FILEBASENAMEASIDENTIFIER___: AbstractCoordinator {

    // MARK: - Delegate Properties
    private unowned let delegate: ___VARIABLE_productName:identifier___CoordinatorDelegate


    // MARK: - Initializer
    public init(delegate: ___VARIABLE_productName:identifier___CoordinatorDelegate, viewController: UINavigationController) {
        self.delegate = delegate
        self.viewController = viewController
        super.init()
    }

    // MARK: - Stored Properties
    private let viewController: UINavigationController

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
