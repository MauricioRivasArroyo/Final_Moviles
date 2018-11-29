//
//  RequestApi.swift
//  iIceAndFire
//
//  Created by Luis Galindo on 11/28/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class RequestApi {
    
    private static func handleError(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    internal static func get<T: Decodable>(for url: String, parameters: [String :  String], responseHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) ->Void = handleError) {
        Alamofire.request(url, method: .get, parameters: parameters).validate()
            .responseJSON { response in
                switch response.result {
                case .success(_):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let responseObject = try decoder.decode(T.self, from: data)
                            responseHandler(responseObject)
                        }
                    } catch {
                        errorHandler(error)
                    }
                    break
                case .failure(let error):
                    errorHandler(error)
                    break
                }
            }
    }
}
