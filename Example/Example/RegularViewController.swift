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

import UIKit
import JRTypedStrings

class RegularViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let simpleView: SimpleView = SimpleView.loadFromNib()
        simpleView.label.text = "Fancy label"
        simpleView.frame = view.bounds
        view.addSubview(simpleView)
        
        let left = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(cancel))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = left
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }


}

