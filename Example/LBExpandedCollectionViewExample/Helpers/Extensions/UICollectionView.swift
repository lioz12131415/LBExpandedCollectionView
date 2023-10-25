//
//  UICollectionView.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit
import Foundation

extension UICollectionView {
    // ==================================================== //
    // MARK: -
    // ==================================================== //
    internal func registerFooter(nibName name: String) {
        let nib = UINib(nibName: name, bundle: Bundle(for: AppDelegate.self))
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: name)
    }
}

extension UICollectionView {
    // ==================================================== //
    // MARK: -
    // ==================================================== //
    internal func registerHeader(nibName name: String) {
        let nib = UINib(nibName: name, bundle: Bundle(for: AppDelegate.self))
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: name)
    }
}

