//
//  Book.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Book: Codable {
    var url: String?
    var name: String?
    var numberOfPages: Int?
    var country: String?
}
