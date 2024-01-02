
import Foundation
import SwiftUI

@MainActor
class MovieViewModel: ObservableObject {
    private let client = APIClient.shared
    
    @Published var searchedMovies: [Movie] = []
    @Published var isLoading: Bool = false

    func searchMovies(search: String) async {
       
        let request = MoviesRequest(search: search)
        do {
            searchedMovies = try await client.send(request).movies
            isLoading = true  
        } catch {
            print("Error fetching movies: \(error)")
        }
        isLoading = false
    }
}


