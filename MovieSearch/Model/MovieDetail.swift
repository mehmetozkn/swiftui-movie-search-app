

import Foundation

struct MovieDetail : Codable {
    
    let title: String
    let year: String
    let director: String
    let writer: String
    let poster: String
    let imdbRating: String
    let imdbId: String
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case director = "Director"
        case writer = "Writer"
        case poster = "Poster"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"

    }
    
}
