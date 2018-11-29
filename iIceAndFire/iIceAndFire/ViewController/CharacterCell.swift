//
//  CharacterCell.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    var character: Character?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(from character: Character) {
        if !character.name!.isEmpty {
            nameLabel.text = character.name
        } else {
            nameLabel.text = "No name"
        }
    }
}
