
import SwiftUI

struct MovieImage: View {
    
    let url : String
    @ObservedObject var imageDownloander = ImageDownloader()
    
    init(url: String) {
        self.url = url
        self.imageDownloander.imageDownload(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloander.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image("placeholder")
                .resizable()
            
        }
    }
}
