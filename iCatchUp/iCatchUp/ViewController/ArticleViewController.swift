//
//  ArticleViewController.swift
//  iCatchUp
//
//  Created by Operador on 11/2/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var article: Article?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if  let article = article,
            let pictureImageView = pictureImageView,
            let urlToImage = article.urlToImage,
            let titleLabel = titleLabel,
            let descriptionLabel = descriptionLabel,
            let contentLabel = contentLabel {
            pictureImageView.setImage(fromUrlString: urlToImage, withDefaultNamed: "no-image-available", withErrorNamed: "no-image")
            titleLabel.text = article.title
            descriptionLabel.text = article.description
            contentLabel.text = article.content
        }
    }
}
