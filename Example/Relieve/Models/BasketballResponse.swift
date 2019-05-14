//
//  BasketballResponse.swift
//  Relieve_Example
//
//  Created by Alexander Korus on 14.05.19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

struct BasketballResponse<T: Codable>: Codable {
    let data: [T]
}
