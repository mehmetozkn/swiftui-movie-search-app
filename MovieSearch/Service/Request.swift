//
//  Request.swift
//  FilmSearch
//
//  Created by Mehmet Macbook Pro on 29.12.2023.
//

import Foundation

protocol Request {
    associatedtype Response: Decodable
    
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var param: String? { get }
    
}

extension Request {
    var asURLRequest: URLRequest {
        let apiKey = "&apikey=f3dd7969"
        let url = URL(string: baseUrl + path + param! + apiKey)!
        let request = URLRequest(url: url)
        return request
    }
}
