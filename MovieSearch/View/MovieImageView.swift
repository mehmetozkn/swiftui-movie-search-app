
import SwiftUI

struct MovieImage: View {
    let movieImageWidthSize : CGFloat
    let movieImageHeightSize :CGFloat
    let url : String
    
    init(movieImageWidthSize: CGFloat, movieImageHeightSize: CGFloat, url: String) {
        self.movieImageWidthSize = movieImageWidthSize
        self.movieImageHeightSize = movieImageHeightSize
        self.url = url
    }
    
    var body: some View {
        AsyncImage(url: imageUrl(url: url)) { image in
            image
                .image?.resizable()
                .frame(width:movieImageWidthSize,
                       height: movieImageHeightSize)
        }
            
    }
    
    func imageUrl(url: String) -> URL {
        return URL(string: url) ?? URL(string: "placeholder")!
    }
}


