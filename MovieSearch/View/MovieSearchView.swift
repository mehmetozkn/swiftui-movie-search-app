

import SwiftUI

struct MovieSearchView: View {

    
    @ObservedObject private var viewModel = MovieViewModel()
    
    @State var searchMovie = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(AppConstants.shared.textFieldText, text: $searchMovie, onCommit: {
                    Task {
                        do {
                            await viewModel.searchMovies(search: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines)
                                .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                        }
                    }
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(viewModel.searchedMovies, id: \.imbdId) { movie in
                    NavigationLink(destination: MovieDetailView(imdbId: movie.imbdId), label: {
                        HStack {
                            MovieImage(movieImageWidthSize: AppConstants.shared.movieImageWidthSize, movieImageHeightSize: AppConstants.shared.movieImageHeightSize, url: movie.poster)
                                
                            VStack(alignment: .leading) {
                                
                                Text(movie.title)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.orange)
                                
                                Text(movie.year)
                                
                                Spacer()
                                
                            }
                        }
                    })
                }
                .listStyle(.plain)
            }
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
