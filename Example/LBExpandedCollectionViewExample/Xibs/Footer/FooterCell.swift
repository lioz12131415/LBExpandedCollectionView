//
//  FooterCell.swift
//  LBExpandedCollectionViewExample
//
//  Created by ליעוז בלקי on 25/10/2023.
//

import UIKit

class FooterCell: UICollectionViewCell {
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /* */
    }
    
    @discardableResult func stopAnimating() -> Self {
        indicatorView.stopAnimating()
        return self
    }
    
    @discardableResult func startAnimating() -> Self {
        indicatorView.startAnimating()
        return self
    }
}


