//
//  ArticleCell.swift
//  iCatchUp
//
//  Created by Operador on 10/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func update(from article: Article) {
        if let urlToImage = article.urlToImage {
        pictureImageView.setImage(
            fromUrlString: urlToImage,
            withDefaultNamed: "no-image-available",
            withErrorNamed: "no-image-available")
        
        }
        titleLabel.text = article.title
    }
}
