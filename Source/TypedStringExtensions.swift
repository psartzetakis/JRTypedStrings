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

public extension UINib {
    
    /// Returns a UINib object initialized to the nib file in the specified bundle.
    ///
    /// - Parameters:
    ///   - type: The type of the nib.
    ///   - name: The name of the nib file. If it is omitted the class name of the type will be used instead.
    ///   - bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    /// - Returns: The initialized UINib object.
    public convenience init<T: UIView>(_ type: T.Type = T.self, name: String? = nil, bundle: Bundle? = nil) {
        let nibName = name ?? String(describing: type)
        self.init(nibName: nibName, bundle: bundle)
    }
}

public extension UIViewController  {
    
    /// Returns a newly initialized typed view controller with the nib file in the specified bundle.
    ///
    /// - Parameters:
    ///   - type: The type of the view controller.
    ///   - name: The name of the nib file. If it is omitted the class name of the type will be used instead.
    ///   - bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    /// - Returns: A newly initialized typed UIViewController object.
    public convenience init<T: UIViewController>(_ type: T.Type = T.self, name: String? = nil, bundle: Bundle? = nil) {
        let nibName = name ?? String(describing: type)
        self.init(nibName: nibName, bundle: bundle)
    }
}

public extension UIView {
    
    /// Returns a view from a nib file.
    ///
    /// - Parameters:
    ///   - type: The type of the view.
    ///   - name: The name of the nib file. If it is omitted the class name of the type will be used instead.
    ///   - bundle: The bundle where the nib is located. If it is ommited the main Bundle will be used.
    /// - Returns: A type UIView object from a nib file.
    public class func loadFromNib<T: UIView>(_ type: T.Type = T.self, name: String? = nil, bundle: Bundle = .main) -> T {
        let nibName = name ?? String(describing: type)
        let views = bundle.loadNibNamed(nibName, owner: nil, options: nil)
        return views!.flatMap({ $0 as? T }).first! 
    }
}



