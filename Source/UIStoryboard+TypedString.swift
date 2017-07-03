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

public extension TypedString where Base: UIStoryboard {
    
    /// Instantiates and returns a typed view controller with the specified identifier.
    ///
    /// - Parameters:
    ///   - type: The type of view controller.
    ///   - storyboardIdentifier: An identifier string that uniquely identifies the view controller in the storyboard file. If it is omitted the class name of the type will be used instead.
    /// - Returns: A typed view controller corresponding to the specified identifier string.
    public func instantiate<T: UIViewController> (_ type: T.Type = T.self, storyboardIdentifier: String? = nil) -> T {
        let identifier = storyboardIdentifier ?? String(describing: type)
        return base.instantiateViewController(withIdentifier: identifier) as! T
    }
}
