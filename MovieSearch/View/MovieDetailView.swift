
import SwiftUI

struct MovieDetailView: View {
    
    
    @ObservedObject private var viewModel = MovieDetailViewModel()
    let imdbId: String
    
    init(imdbId: String) {
        self.imdbId = imdbId
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoaded {
                MovieImage(movieImageWidthSize: AppConstants.shared.movieDetailImageWidthSize, movieImageHeightSize: AppConstants.shared.movieDetailImageWidthSize, url: viewModel.movieDetail?.poster ?? "")
                
                
                Text(viewModel.movieDetail?.title ?? "")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                viewModel.trimText("Year: ", value: viewModel.movieDetail?.year ?? "No Year")
                
                viewModel.trimText("Director: ", value: viewModel.movieDetail?.director ?? "No Director")
                
                viewModel.trimText("Writer: ", value: viewModel.movieDetail?.writer ?? "No Writer")
                
            } else {
                CircularProgressView()
            }
        }.task {
            await viewModel.getMovieDetails(imbdId: imdbId)
        }
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbId: "")
    }
}
