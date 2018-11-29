//
//  SettingsViewController.swift
//  iCatchUp
//
//  Created by Operador on 10/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // test Extension
        let urlString = "https://images.pexels.com/photos/58625/pexels-photo-58625.jpeg?cs=srgb&dl=apple-buildings-camera-58625.jpg&fm=jpg"
        imageView.setImage(fromUrlString: urlString,
                           withDefaultNamed: "no-image-available",
                           withErrorNamed: "incorrect-image")
        
    }

}
