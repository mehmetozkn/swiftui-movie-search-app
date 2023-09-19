

import Foundation

class ImageDownloader: ObservableObject {

    @Published var downloadedImage: Data?

    func imageDownload(url: String) {

        guard let imageUrl = URL(string: url) else {
            return
        }


        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedImage = data
            }


        }.resume()

    }
}
