//
//  HomeViewController.swift
//  iCatchUp
//
//  Created by Operador on 10/29/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os

private let reuseIdentifier = "Cell"

class HomeViewController: UICollectionViewController {
    var articles: [Article] = [Article]()
    var currentRow = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(NewsApi.apiKey)")
        
        NewsApi.getTopHeadlines(
            responseHandler: self.handleResponse,
            errorHandler: self.handleError)
    }

    func handleResponse(response: ArticlesResponse) {
        if response.status == "error" {
            if let message = response.message {
                os_log("%@", message)
            }
            return
        }
        if let articles = response.articles {
            self.articles = articles
            self.collectionView.reloadData()
        }
    }
    
    func handleError(error: Error) {
        let message = "Error on Articles Response: \(error.localizedDescription)"
        os_log("%@", message)
    }
    


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArticleCell
    
        // Configure the cell
        cell.update(from: articles[indexPath.row])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showArticle" {
            let destination = segue.destination as! ArticleViewController
            destination.article = articles[currentRow]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.row
        self.performSegue(withIdentifier: "showArticle", sender: self)
    }
    
}
