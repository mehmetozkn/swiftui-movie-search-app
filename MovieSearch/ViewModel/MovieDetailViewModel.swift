

import Foundation
import SwiftUI


class MovieDetailViewModel : ObservableObject{
    @Published var movieDetail : SpecialMovieDetailViewModel?
    let httpDownloader = HttpDownloader()
   

    func getMovieDetails(imdbId: String) {
        httpDownloader.fetchMovieDetails(imdbId: imdbId) { (result) in
            switch result {
            case .success(let movieDetail):
           
                    DispatchQueue.main.async {
                        self.movieDetail = SpecialMovieDetailViewModel(detail: movieDetail)
                    }

                
            case .failure(let error):
                print(error)

            }
        }
    }
}

// for fetch only requested information
struct SpecialMovieDetailViewModel {
    
    let detail: MovieDetail

    var title: String {
        detail.title
    }

    var poster: String {
        detail.poster
    }
    
    var writer: String {
        detail.writer
    }
    
    var director: String {
        detail.director
    }

    var year: String {
        detail.year
    }

    var imdbId: String {
        detail.imdbId
    }
}

