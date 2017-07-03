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

/// A class that wraps the underlying type.
public final class TypedString<Base> {
    public let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

/// A protocol of a specified type.
public protocol TypedStringCompatible {
    associatedtype CompatibleType
    var ts: CompatibleType { get }
}

/// An extension which the protocol uses the wrapper class as a specified type.
public extension TypedStringCompatible {
    var ts: TypedString<Self> {
        return TypedString(self)
    }
}

extension UITableView: TypedStringCompatible {}
extension UIStoryboard: TypedStringCompatible {}
extension UICollectionView: TypedStringCompatible {}
