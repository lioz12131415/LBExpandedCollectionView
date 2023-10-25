//
//  Object.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit
import Foundation
import LBExpandedCollectionViewFramework

class Object {
    
    internal var image: UIImage?            = nil
    internal var scale: LBExpandedCellScale = .one
    
    internal init(image: UIImage?, scale: LBExpandedCellScale) {
        self.image = image
        self.scale = scale
    }
    
    fileprivate init() {
        /* */
    }
    
    fileprivate static func two() -> [Object] {
        return [
            Object(image: .random, scale: .two),
            Object(image: .random, scale: .one),
            Object(image: .random, scale: .one),
            Object(image: .random, scale: .one),
            Object(image: .random, scale: .one),
        ].shuffled(0..<3)
    }
    
    fileprivate static func one() -> [Object] {
        return [
            Object(image: .random, scale: .one),
            Object(image: .random, scale: .one),
            Object(image: .random, scale: .one),
        ].shuffled()
    }
    
    fileprivate static func four() -> [Object] {
        return [
            Object(image: .random, scale: .four),
            Object(image: .random, scale: .one),
            Object(image: .random, scale: .one),
        ].shuffled()
    }
}

extension Object {
    // ============================================= //
    // MARK: -
    // ============================================= //
    public static func initialize() -> [Object] {
        var objects = [Object]()
        
        for _ in 0..<5 {
            objects += two()
            objects += one()
            objects += four()
        }
        
        return objects
    }
}

extension Object {
    // ============================================= //
    // MARK: -
    // ============================================= //
    internal static var empty: Object {
        return Object()
    }
}
