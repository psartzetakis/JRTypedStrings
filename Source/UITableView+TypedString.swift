//
//  Created by Panagiotis Sartzetakis
//  http://www.sartzetakis.me
//
//
//  GitHub
//  http://github.com/psartzetakis/JRTypedStrings
//
//
//  License
//  Copyright © 2017 Panagiotis Sartzetakis
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import Foundation
import UIKit

public extension TypedString where Base: UITableView {
    
    /// Registers a nib object containing a cell with the table view under a specified identifier.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: The reuse identifier for the cell. If it is omitted the class name of the type will be used instead.
    public func registerNibCell<T: UITableViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) {
        let nib = UINib(T.self)
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    /// Registers a class for use in creating new table cells.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: The reuse identifier for the cell. If it is omitted the class name of the type will be used instead.
    public func registerClassCell<T: UITableViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) {
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(T.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    /// Returns a typed reusable table-view cell object for the specified reuse identifier and adds it to the table.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: A string identifying the cell object to be reused. If it is omitted the class name of the type will be used instead.
    ///   - indexPath: The indexPath specifying the location of the cell.
    /// - Returns: A Typed UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.
    public func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil , for indexPath: IndexPath) -> T {
        let identifier = reuseIdentifier ?? String(describing: type)
        return base.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
    
    /// Returns a typed reusable table-view cell object for the specified reuse identifier and adds it to the table.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: A string identifying the cell object to be reused. If it is omitted the class name of the type will be used instead.
    /// - Returns: A Typed UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.
    public func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) -> T {
        let identifier = reuseIdentifier ?? String(describing: type)
        return base.dequeueReusableCell(withIdentifier: identifier) as! T
    }
    
    /// Registers a nib object containing a header or footer with the table view under a specified identifier.
    ///
    /// - Parameters:
    ///   - type: The type of view that we want to register.
    ///   - reuseIdentifier: The reuse identifier for the header or footer view. TIf it is omitted the class name of the type will be used instead.
    public func registerNibForHeaderFooter<T: UITableViewHeaderFooterView>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) {
        let nib = UINib(T.self)
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    /// Registers a class for use in creating new table header or footer views.
    ///
    /// - Parameters:
    ///   - type: The type of view that we want to register.
    ///   - reuseIdentifier: The reuse identifier for the header or footer view. If it is omitted the class name of the type will be used instead.
    public func registerForHeaderFooter<T: UIView>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) {
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(T.self, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    /// Returns a reusable typed header or footer view located by its identifier.
    ///
    /// - Parameters:
    ///   - type: The type of view that we want to register.
    ///   - reuseIdentifier: A string identifying the header or footer view to be reused. If it is omitted the class name of the type will be used instead.
    /// - Returns: A typed UITableViewHeaderFooterView object with the associated identifier or nil if no such object exists in the reusable view queue.
    public func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) -> T {
        let identifier = reuseIdentifier ?? String(describing: type)
        
        return base.dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
    }
}
