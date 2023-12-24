

import SwiftUI

struct MovieSearchView: View {
    private let movieImageWidthSize = UIScreen.main.bounds.width * 0.2
    private let movieImageHeightSize = UIScreen.main.bounds.height * 0.13
    private let textFieldText = "Search movies"
    private let navigationTitleText = "Movie Search"
    
    @ObservedObject private var viewModel = MovieViewModel()
    
    @State var searchMovie = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField(textFieldText, text: $searchMovie, onCommit: {
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
                            MovieImage(url: movie.poster)
                                .frame(width: movieImageWidthSize
                                       , height: movieImageHeightSize)
                            
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
            .navigationTitle(navigationTitleText)
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
