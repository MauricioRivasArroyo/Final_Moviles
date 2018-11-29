//
//  SourcesViewController.swift
//  iCatchUp
//
//  Created by Operador on 10/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SourcesViewController: UICollectionViewController {
    var sources: [Source] = [Source]()
    var currentRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        NewsApi.getSources(
            responseHandler: self.handleResponse,
            errorHandler: self.handleError)
    }

    func handleResponse(response: SourcesResponse) {
        if response.status == "error" {
            print("Error in response: \(response.message!)")
            return
        }
        if let sources = response.sources {
            self.sources = sources
            self.collectionView.reloadData()
        }
        print("Sources count: \(response.sources!.count)")
    }
    
    func handleError(error: Error) {
        print("Error while requesting Sources: \(error.localizedDescription)")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sources.count
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SourceCell
    
        // Configure the cell
        cell.update(from: sources[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSource" {
            let destination = segue.destination as! SourceViewController
            destination.source = sources[currentRow]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.row
        self.performSegue(withIdentifier: "showSource", sender: self)
    }
}
