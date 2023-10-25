//
//  Request.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit
import Foundation

class Request {
    /*
     * */
    internal static func get(deadline: CGFloat, _ callback: @escaping([Object]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now()+deadline) {
            let objects = Object.initialize()
            DispatchQueue.main.async {
                callback(objects)
            }
        }
    }
}
