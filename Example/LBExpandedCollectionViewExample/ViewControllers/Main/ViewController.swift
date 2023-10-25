//
//  ViewController.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit
import LBExpandedCollectionViewFramework

class ViewController: UIViewController {
    
    @IBOutlet weak var expandedCollectionView: LBExpandedCollectionView!
    
    fileprivate var objects: Array<Object> = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        expandedCollectionView.registerFooter(nibName: "FooterCell")
        expandedCollectionView.registerHeader(nibName: "HeaderCell")
        
        expandedCollectionView.expandedDelegate   = self
        expandedCollectionView.expandedDataSource = self
        
        request(deadline: .zero)
    }
    
    fileprivate func request(deadline: CGFloat) {
        Request.get(deadline: deadline) { [weak self] objects in
            self?.objects.append(contentsOf: objects)
            self?.expandedCollectionView.reloadData()
        }
    }
    
    fileprivate func hasMore(_ indexPath: IndexPath) {
        guard indexPath.row == objects.count-1 else {
            return
        }
        request(deadline: 0.5)
    }
}

extension ViewController: LBExpandedCollectionViewDelegate {
    // ======================================================================= //
    // MARK: -
    // ======================================================================= //
    func expanded(_ collectionView: LBExpandedCollectionView,
                  scaleForCellAt indexPath: IndexPath) -> LBExpandedCellScale {
        return objects[indexPath.item].scale
    }
    
    func expanded(_ collectionView: LBExpandedCollectionView,
                  willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        hasMore(indexPath)
    }
    
    func expanded(_ collectionView: LBExpandedCollectionView,
                  didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func expanded(_ collectionView: LBExpandedCollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func sizeForFooter(in collectionView: LBExpandedCollectionView) -> CGSize {
        return .init(width: collectionView.frame.width, height: 100)
    }
    
    func sizeForHeader(in collectionView: LBExpandedCollectionView) -> CGSize {
        return .init(width: collectionView.frame.width, height: 100)
    }
}


extension ViewController: LBExpandedCollectionViewDataSource {
    // ======================================================================= //
    // MARK: -
    // ======================================================================= //
    func numberOfItems(in collectionView: LBExpandedCollectionView) -> Int {
        return objects.count
    }
    
    func viewForHeader(_ collectionView: LBExpandedCollectionView) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableHeaderView(withIdentifier: "HeaderCell") as! HeaderCell
        
        return header
    }
    
    func viewForFooter(_ collectionView: LBExpandedCollectionView) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableFooterView(withIdentifier: "FooterCell") as! FooterCell
        
        return footer.startAnimating()
    }
    
    func expanded(_ collectionView: LBExpandedCollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LBExpandedCell", for: indexPath) as! LBExpandedCell
        
        cell.object = objects[indexPath.item]
        return cell
    }
}


extension ViewController: LBExpandedCollectionViewDelegateFlowLayout {
    // ======================================================================= //
    // MARK: -
    // ======================================================================= //
    func minimumLineSpacing(_ collectionView: LBExpandedCollectionView,
                            _ collectionViewLayout: LBExpandedCollectionViewFlowLayout) -> CGFloat {
         return 1
    }
    
    func minimumInteritemSpacing(_ collectionView: LBExpandedCollectionView,
                                 _ collectionViewLayout: LBExpandedCollectionViewFlowLayout) -> CGFloat {
        return 1
    }
}


//

//                  +----------------------------------+
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  +----------------------------------+

//                  +----------------------------------+
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  |                                  |
//                  +----------------------------------+
//  +-----------+-----------+----------+

//  +-----------+-----------+----------+         +-----------------------+
//  |                       |          | <-+-----| LBExpandedCellScale - |
//  |                       |     1    |         | index -> 0 == four    |
//  |                       |          |         | index -> 1 == one     |
//  |           0           +----------|         | index -> 2 == one     |
//  |                       |          |         +-----------------------+
//  |                       |     2    |
//  |                       |          |
//  +-----------+-----------+----------+

//  +-----------+-----------+----------+         +-----------------------+
//  |                       |          | <-+-----| LBExpandedCellScale - |
//  |                       |     0    |         | index -> 0 == one     |
//  |                       |          |         | index -> 1 == four    |
//  |           1           +----------|         | index -> 2 == one     |
//  |                       |          |         +-----------------------+
//  |                       |     2    |
//  |                       |          |
//  +-----------+-----------+----------+

//  +-----------+-----------+----------+         +-----------------------+
//  |           |                      | <-+-----| LBExpandedCellScale - |
//  |     0     |                      |         | index -> 0 == one     |
//  |           |                      |         | index -> 1 == one     |
//  |-----------+           2          |         | index -> 2 == four    |
//  |           |                      |         +-----------------------+
//  |     1     |                      |
//  |           |                      |
//  +-----------+-----------+----------+



//  +-----------+-----------+----------+         +-----------------------+
//  |           |           |          | <-+-----| LBExpandedCellScale - |
//  |     0     |     1     |     3    |         | index -> 0 == two     |
//  |           |           |          |         | index -> 1 == one     |
//  +-----------+-----------+----------+         | index -> 2 == one     |
//                                               +-----------------------+
//


//
//  Specifies additional space required surrounding and item when laying out.
//  Flexible spacing can be used to apportion remaining space after items are laid out to
//    evenly align items among available layout space.


// +-----------+
// |           |
// |     0     |
// |           |
// +-----------+


//```swift
//enum LBExpandedCellScale: Int {
//    case one  = 1
//    case two  = 2
//    case four = 4
//}
//
//+-----------+          +-----------+
//|           | <-+----- | Scale one |
//|     0     |          +-----------+
//|           |
//+-----------+
//
//+-----------+          +-----------+
//|           | <-+----- | Scale two |
//|           |          +-----------+
//|           |
//|     0     |
//|           |
//|           |
//|           |
//+-----------+
//
//+-----------+----------+          +------------+
//|                      | <-+----- | Scale four |
//|                      |          +------------+
//|                      |
//|           0          |
//|                      |
//|                      |
//|                      |
//+-----------+----------+
//
//```
