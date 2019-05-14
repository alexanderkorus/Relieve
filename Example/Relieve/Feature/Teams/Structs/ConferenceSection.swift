//
//  ConferenceSection.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 14.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import RxDataSources

/**
 defining the section struct conforms to SectionModelType
 */
struct ConferenceSection {
    var header: String
    var items: [Item]
}

extension ConferenceSection: SectionModelType {
    typealias Item = Team
    
    init(original: ConferenceSection, items: [Item]) {
        self = original
        self.items = items
    }
}
