//___FILEHEADER___

import UIKit
import Relieve
import RxSwift
import RxCocoa

final class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    // MARK: Delegate Properties
    private let delegate: ___VARIABLE_productName:identifier___VCDelegate

    // MARK: Initializers
    init(delegate: ___VARIABLE_productName:identifier___VCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Lifecycle Methods
    override func loadView() {
        self.view = ___VARIABLE_productName:identifier___View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationBar(visibilty: true, title: "", backgroundColor: UIColor.white)

    }

    // MARK: Overridden UIKit Methods

    // MARK: Stored Properties
    private let disposeBag = DisposeBag()

    // MARK: Computed Properties

    // MARK: Instance Methods

}

// MARK: - Views
private extension ___FILEBASENAMEASIDENTIFIER___ {
    unowned var rootView: ___VARIABLE_productName:identifier___View { return self.view as! ___VARIABLE_productName:identifier___View } // swiftlint:disable:this force_cast
}

// MARK: - Target Action Functions
private extension ___FILEBASENAMEASIDENTIFIER___ {

}
