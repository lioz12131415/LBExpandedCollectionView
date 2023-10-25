//
//  LBExpandedCell.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit

class LBExpandedCell: UICollectionViewCell {
        
    @IBOutlet weak var imageView: UIImageView!
    
    internal var object: Object = .empty {
        didSet { setInfo() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /* * * */
    }
    
    fileprivate func setInfo() {
        imageView.image = object.image
    }
}

