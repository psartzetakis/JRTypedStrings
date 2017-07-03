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

class CustomTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.ts.registerNibCell(CustomNibTableViewCell.self)
        tableView.ts.registerNibForHeaderFooter(CustomTableHeaderView.self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomNibTableViewCell = tableView.ts.dequeueReusableCell(for: indexPath)
        cell.label.text = "Example cell \(indexPath.row)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: CustomTableHeaderView = tableView.ts.dequeueReusableHeaderFooter()
        headerView.label.text = "Example Header "
        return headerView
    }
    
    @IBAction func collectionViewItemTapped(_ sender: UIBarButtonItem) {
        let collectionViewController: CustomCollectionViewController = self.storyboard!.ts.instantiate()
        let navigationController = UINavigationController(rootViewController: collectionViewController)
        navigationController.navigationBar.topItem?.title = "CollectionViewController"
        present(navigationController, animated: true, completion: nil)

    }
    
    @IBAction func regularViewControllerItemTapped(_ sender: UIBarButtonItem) {
        let regularViewController: RegularViewController = RegularViewController()
        let navigationController = UINavigationController(rootViewController: regularViewController)
        navigationController.navigationBar.topItem?.title = "Regular View Controller"
        present(navigationController, animated: true, completion: nil)

    }
    
}
