

import Foundation

struct Movie : Codable {
    
    let title : String
    let year : String
    let imbdId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imbdId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}


struct MovieArray : Codable {
    let movies : [Movie]
    
    private enum CodingKeys : String, CodingKey {
        case movies = "Search"
    }
}
