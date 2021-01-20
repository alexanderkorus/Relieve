//___FILEHEADER___

import UIKit
import Relieve
import RxSwift
import RxCocoa
import RxDataSources

class ___FILEBASENAMEASIDENTIFIER___: BaseItemViewController<___VARIABLE_productName:identifier___ViewModel, ___VARIABLE_productName:identifier___State> {

    // MARK: - Delegate Properties
    private let delegate: ___VARIABLE_productName:identifier___VCDelegate

    // MARK: - Stored Properties

    // MARK: - Computed Properties

    // MARK: Initializers
    init(delegate: ___VARIABLE_productName:identifier___VCDelegate) {
        self.delegate = delegate
        super.init(
          viewModel: ___VARIABLE_productName:identifier___ViewModel(initialState: .default)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Instance Methods
    override func bindData() {
        super.bindData()

    }

    override func bindViews() {
        super.bindViews()

    }
}
