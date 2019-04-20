import UIKit
/**
 * TODO: ⚠️️ Add a way to also get response, maybe look into result?
 */
internal extension UIImage{
    typealias DownloadComplete = (UIImage?,IMGError?) -> Void
    enum IMGError: Error {
        case invalideWebPath
        case imageDataIsCorrupted
        case errorGettingDataFromURL
    }
    /**
     * get UIImage from webPath
     */
    static func image(webPath:String, onComplete:@escaping DownloadComplete){
        guard let url = URL.init(string: webPath) else { onComplete(nil,.invalideWebPath);return}
        Utils.downloadImage(url: url, downloadComplete: onComplete)
    }
}
/**
 * Helpers
 */
private class Utils{
    /**
     * Assign and convert data to Image
     */
    static func downloadImage(url: URL, downloadComplete:@escaping UIImage.DownloadComplete) {
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { downloadComplete(nil,.errorGettingDataFromURL); return}
            Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
            guard let image = UIImage(data: data) else {downloadComplete(nil,.imageDataIsCorrupted);return}
            downloadComplete(image,nil)
        }
    }
    typealias URLQuery = (Data?, URLResponse?, Error?) -> ()
    /**
     * Get data from URL
     */
    private static func getDataFromUrl(url: URL, completion: @escaping URLQuery) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
