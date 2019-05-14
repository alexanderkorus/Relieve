//___FILEHEADER___

import Foundation
import RxDataSources

/**
 defining the section struct conforms to SectionModelType
 */
struct ExampleSection {
    var header: String
    var items: [Item]
}

extension ExampleSection: SectionModelType {
    typealias Item = String

    init(original: ExampleSection, items: [Item]) {
        self = original
        self.items = items
    }
}
