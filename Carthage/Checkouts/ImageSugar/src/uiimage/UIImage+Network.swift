#if os(OSX)
import AppKit.NSImage
#else
import UIKit.UIImage
#endif
/**
 * Fixme: ⚠️️ Add a way to also get response, maybe look into result?
 */
 extension UIImage {
   /**
    * get UIImage from webPath
    */
   public static func image(webPath: String, onComplete:@escaping DownloadComplete) {
      guard let url = URL(string: webPath) else { onComplete(nil, .invalideWebPath); return }
      UIImage.downloadImage(url: url, downloadComplete: onComplete)
   }
}
/**
 * Helper methods
 */
 extension UIImage {
   /**
    * Assign and convert data to Image
    * - Fixme: ⚠️️ Add Result type
    */
   fileprivate static func downloadImage(url: URL, downloadComplete:@escaping UIImage.DownloadComplete) {
      getDataFromUrl(url: url) { data, response, error in
         guard let data = data, error == nil else { downloadComplete(nil, .errorGettingDataFromURL); return }
         Swift.print(response?.suggestedFilename ?? url.lastPathComponent)
         guard let image = UIImage(data: data) else { downloadComplete(nil, .imageDataIsCorrupted); return }
         downloadComplete(image, nil)
      }
   }
   fileprivate typealias URLQuery = (Data?, URLResponse?, Error?) -> Void
   /**
    * Get data from URL
    */
   private static func getDataFromUrl(url: URL, completion: @escaping URLQuery) {
      URLSession.shared.dataTask(with: url) { data, response, error in  completion(data, response, error) }.resume()
   }
}
