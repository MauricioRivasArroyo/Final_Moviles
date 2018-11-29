//
//  SourceViewController.swift
//  iCatchUp
//
//  Created by Operador on 11/2/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var favoriteButton: UIButton!
    var isFavorite = false
    
    var source: Source?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let source = source,
           let logoImageView = logoImageView,
           let nameLabel = nameLabel,
           let descriptionLabel = descriptionLabel {
            logoImageView.setImage(
                fromUrlString: source.urlToLogo,
                withDefaultNamed: "no-image-available",
                withErrorNamed: "no-image-available")
            nameLabel.text = source.name
            descriptionLabel.text = source.description
        }
    }
    @IBAction func favoriteAction(_ sender: UIButton) {
        self.isFavorite = !isFavorite
        sender.setImage(UIImage(named: self.isFavorite ?
            "favorite-icon-black" : "favorite-icon-border-black"), for: .normal)
    }
}
