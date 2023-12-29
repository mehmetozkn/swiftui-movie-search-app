

import Foundation
import SwiftUI


class MovieDetailViewModel : ObservableObject{
    
    @Published var movieDetail : MovieDetail?
    @Published var isLoading : Bool = false
    private let client = APIClient.shared
    
    @MainActor
    func getMovieDetails(imbdId: String) async {
        let request = MovieDetailsRequest(imbdId: imbdId)
        do {
            movieDetail = try await client.send(request)
            isLoading = true
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}

