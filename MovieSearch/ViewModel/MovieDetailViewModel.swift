

import Foundation
import SwiftUI

@MainActor
class MovieDetailViewModel : ObservableObject{
    
    @Published var movieDetail : MovieDetail?
    @Published var isLoading : Bool = false
    private let client = APIClient.shared
 
    func getMovieDetails(imbdId: String) async {
        let request = MovieDetailsRequest(imbdId: imbdId)
        do {
            movieDetail = try await client.send(request)
            isLoading = true
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
    
     func trimText(_ title: String, value: String) -> some View {
           Text("\(title): \(value)")
       }
}

