

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieViewModel: MovieViewModel

    @State var searchMovie = ""

    init() {
        self.movieViewModel = MovieViewModel()
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Movie", text: $searchMovie, onCommit: {
                    self.movieViewModel.searchMovie(movieName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines)
                            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                })
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                List(movieViewModel.movies, id: \.imdbId) { movie in

                    NavigationLink(destination: MovieDetailView(imdbId: movie.imdbId), label: {
                            HStack {
                                PrivateImage(url: movie.poster)
                                    .frame(width: UIScreen.main.bounds.width * 0.2
                                           , height: UIScreen.main.bounds.height * 0.13)

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

            }
        }
    }
}

