//
//  Character.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Character: Codable {
    var url: String?
    var name: String?
    var gender: String?
    var culture: String?
    var born: String?
    var died: String?
    var titles: [String]?
}
