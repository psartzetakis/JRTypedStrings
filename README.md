# JRTypedStrings
[![Version Status](https://img.shields.io/cocoapods/v/JRTypedStrings.svg?style=flat-square)][podLink]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage)
![Platform](https://img.shields.io/cocoapods/p/JRTypedStrings.svg?style=flat-square)
[![license MIT](https://img.shields.io/cocoapods/l/JRTypedStrings.svg?style=flat-square)][mitLink]

`JRTypedStrings` provides a convenience API that allows you to access `UIViewControllers`, `UIViews`, `UITableViewCells` and `UICollectionViewCells` in a type-safe way. It also eliminates the use of string identifiers when the identifier is the same as the class name.

## About

Most of the times the identifier of a `UITableViewCell` for example matches the class name. The current API for accessing a `UITableViewCell` is quite cumbersome and it involves string identifiers which can easily introduce typos. Also we will have to implicitly cast to the required *type* and that can result to unsafe and hard to maintain codebase. This is where the `JRTypedStrings` comes to play, it provides a set of extensions which will help you write more elegant and type-safe code.

## Requirements

* iOS 8+
* Swift 4.0
* Xcode 9

## Installation

#### [CocoaPods](http://cocoapods.org)

````ruby
use_frameworks!

pod 'JRTypedStrings'
````
#### [Carthage](https://github.com/Carthage/Carthage)

````bash
github "psartzetakis/JRTypedStrings"
````
## Getting Started
````swift
import JRTypedStrings
````

### Examples

#### UITableViewCell

Before, you had to do the following:

````swift
override func viewDidLoad() {
    super.viewDidLoad()
    let nib = UINib(nibName: "CustomNibTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "CustomNibTableViewCell")
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomNibTableViewCell", for: indexPath) as! CustomNibTableViewCell

    return cell
}
````

Now you can do:

````swift
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.ts.registerNibCell(CustomNibTableViewCell.self)
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: CustomNibTableViewCell = tableView.ts.dequeueReusableCell(for: indexPath)

    return cell
}

````

#### UICollectionViewCell

Before, you had to do the following:

````swift
override func viewDidLoad() {
    super.viewDidLoad()
    let nib = UINib(nibName: "CustomNibCollectionViewCell", bundle: nil)
    collectionView.register(nib, forCellReuseIdentifier: "CustomNibCollectionViewCell")

    let supplementaryViewNib = UINib(nibName: "CustomCollectionViewSupplementaryReusableView", bundle: nil)
    collectionView?.register(supplementaryViewNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CustomCollectionViewSupplementaryReusableView")

}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomNibCollectionViewCell", for: indexPath) as! CustomNibCollectionViewCell

    return cell
}

override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CustomCollectionViewSupplementaryReusableView", for: indexPath) as! CustomCollectionViewSupplementaryReusableView

    return reusableView
}

````

Now you can do:

````swift
override func viewDidLoad() {
    super.viewDidLoad()
    collectionView!.ts.registerNibCell(CustomCollectionViewCell.self)
    collectionView!.ts.registerNibForSupplementaryView(CustomCollectionViewSupplementaryReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader)

}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: CustomCollectionViewCell = collectionView.ts.dequeueReusableCell(for: indexPath)

    return cell
}

override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let reusableView: CustomCollectionViewSupplementaryReusableView = collectionView.ts.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath)

    return reusableView
}

````

#### UIViewController

Before, you had to do the following:

````swift
let collectionViewController = self.storyboard!.instantiateViewController(withIdentifier: "CustomCollectionViewController") as! CustomCollectionViewController
````

Now you can do:

````swift
let collectionViewController: CustomCollectionViewController = self.storyboard!.ts.instantiate()
````

#### UIView from nib

````swift
let simpleView: SimpleView = SimpleView.loadFromNib()
````

There are a few more example available at **Example/**.

## Licence

```JRTypedStrings``` is being provided under [MIT Licence][MIT].



[MIT]:<https://opensource.org/licenses/MIT>

>Copyright © 2017-present Panagiotis Sartzetakis

[podLink]:https://cocoapods.org/pods/JRTypedStrings
[mitLink]:http://opensource.org/licenses/MIT
