//
//  SourceCell.swift
//  iCatchUp
//
//  Created by Operador on 10/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class SourceCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(from source: Source) {
        logoImageView.setImage(
            fromUrlString: source.urlToLogo,
            withDefaultNamed: "no-image-available",
            withErrorNamed: "no-image-available")
        nameLabel.text = source.name
    }
}
