# LBExpandedCollectionView
This library provides a custom UICollectionView that allows to expand the cells. Provides a simple API to manage collection view appearance.

<br>

## LBExpandedCellScale ##

```swift

enum LBExpandedCellScale: Int {
    case one  = 1
    case two  = 2
    case four = 4
}

```

<br>

## Protocols ##

### Delegate
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

### DataSource
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



## Expanded Cells Design ##

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
|     0     |     1     |     3    |         | index -> 0 == one     |
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

## LBExpandedCellScale ##

```swift



```
