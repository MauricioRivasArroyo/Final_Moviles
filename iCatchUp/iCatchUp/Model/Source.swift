//
//  Source.swift
//  iCatchUp
//
//  Created by Operador on 10/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Source: Codable {
    var id: String
    var name: String
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
    
    var urlToLogo: String {
        return LogoApi.urlToLogo(forSource: self)
    }
    
    var isFavorite: Bool {
        return FavoritesStore.shared.isFavorite(source: self)
    }
}
