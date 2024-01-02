

import Foundation
import SwiftUI

@MainActor
class MovieDetailViewModel : ObservableObject{
    private let client = APIClient.shared
    
    @Published var movieDetail : MovieDetail?
    @Published var isLoaded : Bool = false
  
    func getMovieDetails(imbdId: String) async {
        let request = MovieDetailsRequest(imbdId: imbdId)
        do {
            movieDetail = try await client.send(request)
            isLoaded = true
        } catch {
            print("Error fetching movie detail: \(error)")
        }
    }
    
     func trimText(_ title: String, value: String) -> some View {
           Text("\(title): \(value)")
       }
}

