//___FILEHEADER___

import UIKit
import Relieve
import RxSwift
import RxCocoa

public final class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    // MARK: Delegate Properties
    private unowned let delegate: ___VARIABLE_productName:identifier___VCDelegate

    // MARK: Initializers
    public init(delegate: ___VARIABLE_productName:identifier___VCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Lifecycle Methods
    public override func loadView() {
        self.view = ___VARIABLE_productName:identifier___View()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavigationBar(visibilty: true, title: "", backgroundColor: UIColor.white)

        self.setUpTapRecognizer(with: [:])

        self.setUpTargetActions(with: [:])

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
