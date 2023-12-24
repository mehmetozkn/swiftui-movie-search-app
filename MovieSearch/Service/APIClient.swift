

import Foundation

class APIClient {
    static let shared = APIClient()
    
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    private let baseURL = "https://www.omdbapi.com/"
    private let apiKey = "f3dd7969"
    
    func fetchMovies(search: String) async throws -> [Movie] {
        guard let url = makeURL(endpoint: "s", parameter: search) else {
            throw NetworkError.wrongUrl
        }
        do {
            let (data, _) = try await session.data(from: url)
            let response = try decoder.decode(MoviesResponse.self, from: data)
            return response.movies
        } catch {
            throw NetworkError.noData
        }
    }
    
    func fetchMovieDetails(imdbId: String) async throws -> MovieDetail {
        guard let url = makeURL(endpoint: "i", parameter: imdbId) else {
            throw NetworkError.wrongUrl
        }
        do {
            let (data, _) = try await session.data(from: url)
            let response = try decoder.decode(MovieDetail.self, from: data)
            return response
        } catch {
            throw NetworkError.noData
        }
    }
}

extension APIClient {
    private func makeURL(endpoint: String, parameter: String) -> URL? {
        let urlString = "\(baseURL)?\(endpoint)=\(parameter)&apikey=\(apiKey)"
        return URL(string: urlString)
    }
}

enum NetworkError: Error {
    case wrongUrl
    case noData
}
