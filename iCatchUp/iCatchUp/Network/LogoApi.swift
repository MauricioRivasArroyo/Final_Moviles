//
//  LogoApi.swift
//  iCatchUp
//
//  Created by Operador on 10/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

class LogoApi {
    static let baseUrl = "https://logo.clearbit.com/"
    
    static func urlToLogo(forSource source: Source) -> String {
        guard let url = URL(string: source.url!), let hostString = url.host else {
            return "\(baseUrl)\(source.url!)"
        }
        return "\(baseUrl)\(hostString)"
    }
}
