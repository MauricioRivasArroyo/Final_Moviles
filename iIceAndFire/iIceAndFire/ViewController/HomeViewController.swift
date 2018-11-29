//
//  HomeViewController.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nBooksLabel: UILabel!
    @IBOutlet weak var nCharactersLabel: UILabel!
    @IBOutlet weak var nHousesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IceAndFireApi.getBooks(responseHandler: handleBooksResponse)
        IceAndFireApi.getCharacters(responseHandler: handleCharacterResponse)
        IceAndFireApi.getHouses(responseHandler: handleHousesResponse)
    }
    
    private func handleBooksResponse(books: [Book]) {
        nBooksLabel.text = "Number of books: \(books.count)"
    }
    
    private func handleCharacterResponse(chars: [Character]) {
        nCharactersLabel.text = "Number of characters: \(chars.count)"
    }
    
    private func handleHousesResponse(houses: [House]) {
        nHousesLabel.text = "Number of houses: \(houses.count)"
    }
}
