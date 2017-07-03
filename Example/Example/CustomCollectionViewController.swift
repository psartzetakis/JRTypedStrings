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

class CustomCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.ts.registerNibCell(CustomCollectionViewCell.self)
        collectionView!.ts.registerNibForSupplementaryView(CustomCollectionViewSupplementaryReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader)
       
        let left = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(cancel))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = left
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = collectionView.ts.dequeueReusableCell(for: indexPath)
        cell.label.text = "\(indexPath.item)"
        cell.label.backgroundColor = indexPath.item % 2 == 0 ? .blue : .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: CustomCollectionViewSupplementaryReusableView = collectionView.ts.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath)
        reusableView.label.text = "Header"
        
        return reusableView
    }

}
