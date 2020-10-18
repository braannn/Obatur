//
//  CollectionViewCell.swift
//  Obatur
//
//  Created by Jason Yang on 12/10/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = true
    }
    
    func configure(with name: String) {
        nameLabel.text = name
    }
    
}
