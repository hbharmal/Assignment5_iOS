//
//  AnimalCollectionViewCell.swift
//  hab889_assignment5
//
//  Created by Hussain Bharmal on 10/12/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var AnimalImageView: UIImageView!
    @IBOutlet weak var AnimalLabel: UILabel!
    
    public func configure(with model: GalleryItem) {
        AnimalImageView.image = UIImage(named: model.image)
        AnimalLabel.text = model.caption
        
        AnimalLabel.textAlignment = .center
    }
    
}
