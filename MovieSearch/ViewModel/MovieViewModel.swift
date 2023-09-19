
import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {

    @Published var movies = [SpecialMovieViewModel]()
    let httpDownloader = HttpDownloader()

    func searchMovie(movieName: String) {
        httpDownloader.fetchMovies(search: movieName) { (result) in
            switch result {
            case .success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movies = movieArray.map(SpecialMovieViewModel.init)
                    }

                }

            case .failure(let error):
                print(error)

            }
        }
    }
}

// for fetch only requested information
struct SpecialMovieViewModel {
    let movie: Movie

    var title: String {
        movie.title
    }

    var poster: String {
        movie.poster
    }

    var year: String {
        movie.year
    }

    var imdbId: String {
        movie.imbdId
    }
}
