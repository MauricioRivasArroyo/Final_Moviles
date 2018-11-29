//
//  NewsApi.swift
//  iCatchUp
//
//  Created by Operador on 10/22/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class NewsApi {
    static let baseUrl = "https://newsapi.org"
    static let sourcesUrl = "\(baseUrl)/v2/sources"
    static let topHeadlinesUrl = "\(baseUrl)/v2/top-headlines"
    static let everythingUrl = "\(baseUrl)/v2/everything"
    
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    
    static private func get<T: Decodable>(
        urlString: String,
        parameters: [String : Any],
        responseType: T.Type,
        responseHandler: @escaping ((T) -> (Void)),
        errorHandler: (@escaping (Error) -> (Void)) = handleError) {
        Alamofire.request(urlString,
                          method: .get,
                          parameters: parameters)
            .validate()
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(
                            withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let dataResponse = try decoder.decode(
                            responseType, from: data)
                        responseHandler(dataResponse)
                    } catch {
                        print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
    }
    
    static func getSources(responseHandler: @escaping (SourcesResponse) -> (Void),
                           errorHandler: (@escaping (Error) -> (Void)) = handleError) {
        let parameters = ["apiKey" : apiKey]
        
        self.get(urlString: sourcesUrl, parameters: parameters, responseType: SourcesResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func getTopHeadlines(responseHandler: @escaping (ArticlesResponse) -> (Void),
                                errorHandler: @escaping (Error) -> (Void)) {
        let parameters = ["apiKey" : apiKey, "language" : "en"]
        self.get(urlString: topHeadlinesUrl, parameters: parameters, responseType: ArticlesResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func getArticles(fromSources sources: String?,
                            responseHandler: @escaping (ArticlesResponse) -> (Void),
                            errorHandler: @escaping (Error) -> (Void)) {
        var parameters = ["apiKey" : apiKey]
        if let sources = sources {
            parameters["sources"] = sources
        }
        self.get(urlString: everythingUrl, parameters: parameters, responseType: ArticlesResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static var apiKey: String {
        return Bundle.main.object(forInfoDictionaryKey: "NewsApiKey") as! String
    }
}
