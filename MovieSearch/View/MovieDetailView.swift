
import SwiftUI

struct MovieDetailView: View {
    let imdbId: String

    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()

    var body: some View {
        VStack {

            PrivateImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6,
                height: UIScreen.main.bounds.height * 0.3, alignment: .center)

            Text(movieDetailViewModel.movieDetail?.title ?? "")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "No Year")")
                .padding()
            
            Text("Director: \(movieDetailViewModel.movieDetail?.director ?? "No Director")")
                .padding()
            
            Text("Writer: \(movieDetailViewModel.movieDetail?.writer ?? "No Writer")")
                .padding()
            
        }.onAppear(perform: {
            self.movieDetailViewModel.getMovieDetails(imdbId: imdbId)
        })
    }
}

