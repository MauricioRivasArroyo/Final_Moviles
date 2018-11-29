//
//  GotApi.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class GotApi: RequestApi {
    static let gotBaseUrl = "http://got-quotes.herokuapp.com/"
    static let gotQuoteUrl = "\(gotBaseUrl)quotes"
    
    static func getQuote(responseHandler: @escaping (Quote) -> Void) {
        get(for: gotQuoteUrl, parameters: [:], responseHandler: responseHandler)
    }
}
