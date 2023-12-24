
import Foundation
import SwiftUI

class MovieViewModel: ObservableObject {
    
    @Published var searchedMovies: [Movie] = []
    private let client = APIClient.shared
    
    @MainActor
    func searchMovies(search: String) async {
        do {
            searchedMovies = try await client.fetchMovies(search: search)
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}


