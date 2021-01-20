//___FILEHEADER___

import UIKit
import RxCocoa
import RxSwift

struct ___VARIABLE_productName:identifier___State: BaseItemState {

    static var `default`: ___VARIABLE_productName:identifier___State {
        ___VARIABLE_productName:identifier___State(
        	items: BehaviorRelay<[ItemGroup]>(value: [])
        )
    }

    var items: BehaviorRelay<[ItemGroup]>
}

class ___FILEBASENAMEASIDENTIFIER___: BaseItemViewModel<___VARIABLE_productName:identifier___State> {

    // MARK: Initializers
    override func buildLayout() {

    }
}
