
import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {
    
    @Published var searchedMovies: [Movie] = []
    private let client = APIClient.shared
    
    @MainActor
    func searchMovies(search: String) async {
        let request = MoviesRequest(search: search)
        do {
            searchedMovies = try await client.send(request).movies
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}


