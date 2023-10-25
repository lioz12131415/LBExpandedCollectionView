# LBExpandedCollectionView
This library provides a custom UICollectionView that allows to expand the cells. Provides a simple API to manage collection view appearance.

<br>

|Storyboard Setup:|
|:---|
|<p> <img src="https://raw.githubusercontent.com/lioz12131415/LBExpandedCollectionView/main/Images/setup.png" width="400" /> </p>|

## Example Project 

<p float="center">
<img src="https://raw.githubusercontent.com/lioz12131415/LBExpandedCollectionView/main/Images/screen_snapshot_zero.jpg" width="210" />
<img src="https://raw.githubusercontent.com/lioz12131415/LBExpandedCollectionView/main/Gifs/zero.gif" width="210" /> 
<img src="https://raw.githubusercontent.com/lioz12131415/LBExpandedCollectionView/main/Images/screen_snapshot_one.PNG"  width="425" />
</p>

<br>

# Protocols #

## Example ##
```swift
class ViewController: UIViewController {

    @IBOutlet weak var expandedCollectionView: LBExpandedCollectionView!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        expandedCollectionView.expandedDelegate   = self
        expandedCollectionView.expandedDataSource = self
    }
}
```

## Delegate - LBExpandedCollectionViewDelegate
### The Collection Delegate Methods.

```swift
@objc public protocol LBExpandedCollectionViewDelegate {

    /*
     * Scale For Cell At IndexPath
     * */
     optional func expanded(_ collectionView: LBExpandedCollectionView,
                            scaleForCellAt indexPath: IndexPath) -> LBExpandedCellScale
    /*
     * Will Display Cell for Collection Item At IndexPath.
     * */
    optional func expanded(_ collectionView: LBExpandedCollectionView, 
                           willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    /*
     * Did End Displaying Cell for Collection Item At IndexPath.
     * */
     optional func expanded(_ collectionView: LBExpandedCollectionView,
                             didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    /*
     * Size For Collection Footer
     * */
    optional func sizeForFooter(in collectionView: LBExpandedCollectionView) -> CGSize
    /* 
     * Size For Collection Header
     * */
    optional func sizeForHeader(in collectionView: LBExpandedCollectionView) -> CGSize
    /*
     * Did Select Collection Item At IndexPath
     * */
     optional func expanded(_ collectionView: LBExpandedCollectionView, didSelectItemAt indexPath: IndexPath)
}
```

## DataSource - LBExpandedCollectionViewDataSource
### The Collection Data Source Methods.

```swift
@objc public protocol LBExpandedCollectionViewDataSource {
    /*
     * Number Of Collection Items.
     * */
    func numberOfItems(in collectionView: LBExpandedCollectionView) -> Int
    /*
     * View For Collection Header.
     * */
    optional func viewForHeader(_ collectionView: LBExpandedCollectionView) -> UICollectionReusableView
    /*
     * View For Collection Footer.
     * */
    optional func viewForFooter(_ collectionView: LBExpandedCollectionView) -> UICollectionReusableView
    /* 
     * Cell For Collection Item At IndexPath.
     * */
    func expanded(_ collectionView: LBExpandedCollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}                                                                                                
```

## DelegateFlowLayout - LBExpandedCollectionViewDelegateFlowLayout
### The Collection Flow Layout Delegate Methods.

```swift
@objc public protocol LBExpandedCollectionViewDelegateFlowLayout: LBExpandedCollectionViewDelegate {
    /*
     * Spacing -> Top \ Bottom
     * */
     optional func minimumLineSpacing(_ collectionView:       LBExpandedCollectionView,
                                      _ collectionViewLayout: LBExpandedCollectionViewFlowLayout) -> CGFloat
    /*
     * Spacing Left \ Right
     * */
     optional func minimumInteritemSpacing(_ collectionView:       LBExpandedCollectionView,
                                           _ collectionViewLayout: LBExpandedCollectionViewFlowLayout) -> CGFloat
}                                                                                                
```

<br>

# LBExpandedCellScale #

```swift
enum LBExpandedCellScale: Int {
    case one  = 1
    case two  = 2
    case four = 4
}
```

<br>

# Expanded Cells Design #

```swift

+-----------+          +---------------------+
|           | <-+----- | Scale one           |
|     0     |          +---------------------+
|           |          | LBExpandedCellScale |
+-----------+          +---------------------+

+-----------+          +---------------------+
|           | <-+----- | Scale two           |
|           |          +---------------------+
|           |          | LBExpandedCellScale |       
|     0     |          +---------------------+
|           |
|           |
|           |
+-----------+

+-----------+----------+          +---------------------+
|                      | <-+----- | Scale four          |
|                      |          +---------------------+
|                      |          | LBExpandedCellScale |   
|           0          |          +---------------------+
|                      |
|                      |
|                      |
+-----------+----------+

+-----------+-----------+----------+         +-----------------------+
|           |           |          | <-+-----| LBExpandedCellScale - |
|     0     |     1     |     2    |         | index -> 0 == one     |
|           |           |          |         | index -> 1 == one     |
+-----------+-----------+----------+         | index -> 2 == one     |
                                             +-----------------------+

+-----------+-----------+----------+         +-----------------------+
|           |           |          | <-+-----| LBExpandedCellScale - |
|           |     1     |     2    |         | index -> 0 == two     |
|           |           |          |         | index -> 1 == one     |
|     0     |-----------+----------|         | index -> 2 == one     |
|           |           |          |         | index -> 3 == one     |
|           |     3     |     4    |         | index -> 4 == one     |
|           |           |          |         +-----------------------+
+-----------+-----------+----------+

+-----------+-----------+----------+         +-----------------------+
|           |           |          | <-+-----| LBExpandedCellScale - |
|           |     0     |     2    |         | index -> 1 == two     |
|           |           |          |         | index -> 0 == one     |
|     1     |-----------+----------|         | index -> 1 == one     |
|           |           |          |         | index -> 2 == one     |
|           |     3     |     4    |         | index -> 3 == one     |
|           |           |          |         +-----------------------+
+-----------+-----------+----------+

+-----------+-----------+----------+         +-----------------------+
|           |           |          | <-+-----| LBExpandedCellScale - |
|     0     |     1     |          |         | index -> 2 == two     |
|           |           |          |         | index -> 0 == one     |
|-----------+-----------|     2    |         | index -> 1 == one     |
|           |           |          |         | index -> 3 == one     |
|     3     |     4     |          |         | index -> 4 == one     |
|           |           |          |         +-----------------------+
+-----------+-----------+----------+

+-----------+-----------+----------+         +-----------------------+
|                       |          | <-+-----| LBExpandedCellScale - |
|                       |     1    |         | index -> 0 == four    |
|                       |          |         | index -> 1 == one     |
|           0           +----------|         | index -> 2 == one     |
|                       |          |         +-----------------------+
|                       |     2    |
|                       |          |
+-----------+-----------+----------+

+-----------+-----------+----------+         +-----------------------+
|                       |          | <-+-----| LBExpandedCellScale - |
|                       |     0    |         | index -> 0 == one     |
|                       |          |         | index -> 1 == four    |
|           1           +----------|         | index -> 2 == one     |
|                       |          |         +-----------------------+
|                       |     2    |
|                       |          |
+-----------+-----------+----------+

+-----------+-----------+----------+         +-----------------------+
|           |                      | <-+-----| LBExpandedCellScale - |
|     0     |                      |         | index -> 0 == one     |
|           |                      |         | index -> 1 == one     |
|-----------+           2          |         | index -> 2 == four    |
|           |                      |         +-----------------------+
|     1     |                      |
|           |                      |
+-----------+-----------+----------+

```

<br>

# Install #
The recommended approach for installing LBExpandedCollectionView is the CocoaPods package manager.

Install CocoaPods if not already available:
```
$ sudo gem install cocoapods
```

Edit your Podfile and add LBExpandedCollectionView:
```
platform :ios, '14.0'
use_frameworks!

target 'MyApp' do
  pod 'LBExpandedCollectionViewFramework'
end
```

Install into your project:
```
$ pod install
```

# Requirements #
LBExpandedCollectionView requires at least iOS 14 or above.
