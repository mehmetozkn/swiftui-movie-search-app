

import Foundation


class HttpDownloader {


    func fetchMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) ->
        Void) {

        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=f3dd7969") else {
            return completion(.failure(.wrongUrl))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let movieResponse = try? JSONDecoder().decode(IncomingMovies.self, from: data)
                else {
                return completion(.failure(.noData))
            }

            completion(.success(movieResponse.movies))

        }.resume()
    }


    func fetchMovieDetails(imdbId: String, completion: @escaping (Result<MovieDetail, DownloaderError>) ->
        Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=f3dd7969") else {
            return completion(.failure(.wrongUrl))
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data)
                else {
                return completion(.failure(.noData))
            }

            completion(.success(movieDetailResponse))

        }.resume()
    }
}


enum DownloaderError: Error {
    case wrongUrl
    case noData
}
