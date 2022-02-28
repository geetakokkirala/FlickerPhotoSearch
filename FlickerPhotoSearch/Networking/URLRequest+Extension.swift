//
//  URLRequest+Extension.swift
//  Movies
//
//  Created by Geetha on 25/02/22..
//

import Foundation

extension URLRequest {
    static func getURLRequest(for apiRequest:ApiRequestType)-> URLRequest? {
        if let url = URL(string:apiRequest.baseUrl.appending(apiRequest.path)),
           var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false){
            let queryItems = apiRequest.params.map { key, value in
                URLQueryItem(name: key, value: value)
            }
            urlComponents.queryItems = queryItems
            let urlRequest = URLRequest(url: urlComponents.url!)
            return urlRequest
        } else {
            return nil
        }
    }
}
