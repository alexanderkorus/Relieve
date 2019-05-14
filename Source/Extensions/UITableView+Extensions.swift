//
//  UITableView+Extensions.swift
//  Relieve
//
//  Created by Alexander Korus on 14.05.19.
//

import Foundation

public extension UITableView {
    
    /**
    Get the cell instance from a specific UITableViewCell
    */
    func getCell<T: RelieveTableViewCell>(_ type: T.Type, indexPath: IndexPath? = nil) -> T? {
        
        if let indexPath = indexPath {
            return self.dequeueReusableCell(withIdentifier: T.Identifier, for: indexPath) as? T
        } else {
            return self.dequeueReusableCell(withIdentifier: T.Identifier) as? T
            
        }
    }
    
    /**
    Register a UITableViewCell to the table view
    */
    func register<T: RelieveTableViewCell>(_ type: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.Identifier)
    }
    
    /**
    Register the TableViewCells in the given array to the table view
    */
    func register<T: RelieveTableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { self.register($0.self, forCellReuseIdentifier: $0.Identifier) }
    }
}
