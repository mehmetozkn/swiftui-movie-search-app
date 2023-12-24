

import Foundation
import SwiftUI


class MovieDetailViewModel : ObservableObject{
    
    @Published var movieDetail : MovieDetail?
    @Published var isLoading : Bool = false
    private let client = APIClient.shared
    
    @MainActor
    func getMovieDetails(imbdId: String) async {
        do {
            movieDetail = try await client.fetchMovieDetails(imdbId: imbdId)
            isLoading = true
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}

