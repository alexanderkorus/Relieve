//
//  TeamVCDelegate.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 13.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol TeamsVCDelegate: class {
    func refresh(completion: (([ConferenceSection]?) -> Void)?)
}
