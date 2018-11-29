//
//  CharacterViewController.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var cultureLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var diedLabel: UILabel!
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(from: self.character)
    }
    
    func update(from character: Character?) {
        if let char = self.character {
            nameLabel.text = validateString(for: char.name!, name: "Name")
            genreLabel.text = validateString(for: char.gender!, name: "Gender")
            cultureLabel.text = validateString(for: char.culture!, name: "Culture")
            bornLabel.text = validateString(for: char.born!, name: "Born")
            diedLabel.text = validateString(for: char.died!, name: "Died")
        }
    }
    
    func validateString(for text: String, name: String) -> String {
        var value = ""
        if text.isEmpty {
            value = "No \(name)"
        } else {
            value = "\(name): \(text)"
        }
        return value
    }
}
