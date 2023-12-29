//
//  MovieRequest.swift
//  FilmSearch
//
//  Created by Mehmet Macbook Pro on 29.12.2023.
//

import Foundation

typealias MovieResponse = MovieArray

struct MoviesRequest: Request {
    typealias Response = MovieResponse
    
    let baseUrl: String = "https://www.omdbapi.com/"
    let path: String = "?s="
    let method: HTTPMethod = .GET
    let param: String?

    init(search: String) {
        param = search
    }
}
