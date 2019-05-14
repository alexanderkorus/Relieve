//
//  RelieveTableViewCell.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

import Foundation

/**
 Protocol for UITableViewCell to ensure that identifier is implemented
 */
public protocol RelieveTableViewCell: UITableViewCell {
    
    static var Identifier: String { get }
    
}
