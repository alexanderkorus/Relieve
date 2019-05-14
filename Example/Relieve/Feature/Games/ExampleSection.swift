//
//  ExampleSection.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 15.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

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
