
import SwiftUI

struct MovieDetailView: View {
    private let movieImageWidthSize =  UIScreen.main.bounds.width * 0.6
    private let movieImageHeightSize =  UIScreen.main.bounds.height * 0.3
    
    @ObservedObject private var viewModel = MovieDetailViewModel()
    let imdbId: String
    
    init(imdbId: String) {
        self.imdbId = imdbId
    }
    
    var body: some View {
            VStack {
                MovieImage(movieImageWidthSize: movieImageWidthSize, movieImageHeightSize: movieImageHeightSize, url: viewModel.movieDetail?.poster ?? "")
                   
                
                Text(viewModel.movieDetail?.title ?? "")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Year: \(viewModel.movieDetail?.year ?? "No Year")")
                    .padding()
                
                Text("Director: \(viewModel.movieDetail?.director ?? "No Director")")
                    .padding()
                
                Text("Writer: \(viewModel.movieDetail?.writer ?? "No Writer")")
                    .padding()
                
            }.task {
                await viewModel.getMovieDetails(imbdId: imdbId)
            }
    }
}

