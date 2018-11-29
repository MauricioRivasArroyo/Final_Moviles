//
//  IceAndFireApi.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class IceAndFireApi: RequestApi {
    static let baseUrl = "https://anapioficeandfire.com/"
    static let booksUrl = "\(baseUrl)api/books"
    static let charactersUrl = "\(baseUrl)api/characters"
    static let housesUrl = "\(baseUrl)api/houses"
    
    static func getBooks(responseHandler: @escaping ([Book]) -> Void) {
        get(for: booksUrl, parameters: [:], responseHandler: responseHandler)
    }
    
    static func getCharacters(responseHandler: @escaping ([Character]) -> Void) {
        get(for: charactersUrl, parameters: [:], responseHandler: responseHandler)
    }
    
    static func getHouses(responseHandler: @escaping ([House]) -> Void) {
        get(for: housesUrl, parameters: [:], responseHandler: responseHandler)
    }
}
