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

public extension  TypedString where Base: UICollectionView {
        
    /// Register a nib file for use in creating new collection view cells.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: The reuse identifier to associate with the specified nib file. If it is omitted the class name of the type will be used instead.
    public func registerNibCell<T: UICollectionViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) {
        let nib = UINib(T.self)
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    /// Register a class for use in creating new collection view cells.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: The reuse identifier to associate with the specified class. If it is omitted the class name of the type will be used instead.
    public func registerClassCell<T: UICollectionViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil) {
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(T.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    /// Returns the visible cell object at the specified index path.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - indexPath: The index path that specifies the section and item number of the cell.
    /// - Returns: The cell object at the corresponding index path or nil if the cell is not visible or indexPath is out of range.
    public func cellForItem<T: UICollectionViewCell>(_ type: T.Type = T.self, indexPath: IndexPath) -> T? {
        return base.cellForItem(at: indexPath) as? T
    }
    
    /// Returns a reusable cell object located by its identifier.
    ///
    /// - Parameters:
    ///   - type: The type of cell that we want to register.
    ///   - reuseIdentifier: The reuse identifier to associate with the specified class. If it is omitted the class name of the type will be used instead.
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Returns: A valid typed UICollectionViewCell object.
    public func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type = T.self, reuseIdentifier: String? = nil ,for indexPath: IndexPath) -> T {
        let identifier = reuseIdentifier ?? String(describing: type)
        return base.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    /// Registers a nib file for use in creating supplementary views for the collection view.
    ///
    /// - Parameters:
    ///   - type: The type of view that we want to register.
    ///   - kind: The kind of supplementary view to create.
    ///   - reuseIdentifier: The reuse identifier to associate with the specified nib file. If it is omitted the class name of the type will be used instead.
    public func registerNibForSupplementaryView<T: UICollectionReusableView>(_ type: T.Type = T.self, forSupplementaryViewOfKind kind: String, reuseIdentifier: String? = nil) {
        let nib = UINib(T.self)
        let identifier = reuseIdentifier ?? String(describing: type)
        base.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    /// Registers a class for use in creating supplementary views for the collection view.
    ///
    /// - Parameters:
    ///   - type: The type of view that we want to register.
    ///   - elementKind: The kind of supplementary view to create.
    ///   - reuseIdentifier: The reuse identifier to associate with the specified nib file. If it is omitted the class name of the type will be used instead.
    public func registerClassForSupplementaryView<T: UICollectionViewCell>(_ type: T.Type = T.self, forSupplementaryViewOfKind elementKind: String, reuseIdentifier: String? = nil) {
        let reuseIdentifier = reuseIdentifier ?? String(describing: type)
        base.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: reuseIdentifier)
    }
    
    /// Returns a reusable supplementary view located by its identifier and kind.
    ///
    /// - Parameters:
    ///   - type: The type of view that we want to register.
    ///   - elementKind: The kind of supplementary view to retrieve.
    ///   - reuseIdentifier: The reuse identifier to associate with the specified nib file. If it is omitted the class name of the type will be used instead.
    ///   - indexPath: The index path specifying the location of the supplementary view in the collection view.
    /// - Returns: A valid typed UICollectionReusableView object.
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_ type: T.Type = T.self, ofKind elementKind: String, reuseIdentifier: String? = nil ,for indexPath: IndexPath) -> T {
        let identifier = reuseIdentifier ?? String(describing: type)
        return base.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
}
