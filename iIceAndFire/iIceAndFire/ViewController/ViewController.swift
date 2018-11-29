//
//  ViewController.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GotApi.getQuote(responseHandler: handleResponse)
    }

    private func handleResponse(response: Quote) {
        quoteLabel.text = response.quote
        characterLabel.text = response.character
    }
}

