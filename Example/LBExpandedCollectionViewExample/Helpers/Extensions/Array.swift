//
//  Array.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit
import Foundation

extension Array {
    // ============================================= //
    // MARK: -
    // ============================================= //
    internal func shuffled(_ range: Range<Int>) -> Array<Element> {
        var slice0 = self[range.lowerBound..<range.upperBound]
        let slice1 = self[range.upperBound..<count]
        
        slice0.shuffle()
        return Array(slice0) + Array(slice1)
    }
}

extension Array where Element == UIImage? {
    // ============================================= //
    // MARK: -
    // ============================================= //
    static var all: [UIImage?] {
        return (1...11).map { UIImage(named: "\($0)") }
    }
}
