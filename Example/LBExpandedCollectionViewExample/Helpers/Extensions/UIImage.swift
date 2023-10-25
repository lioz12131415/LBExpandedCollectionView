//
//  UIImage.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit
import Foundation

extension UIImage {
    // ============================================= //
    // MARK: -
    // ============================================= //
    static var images: [UIImage?] = .all
    
    static var random: UIImage? {
        images = images.count == .zero ? .all : images.shuffled()
        return images.popLast() ?? nil
    }
}
