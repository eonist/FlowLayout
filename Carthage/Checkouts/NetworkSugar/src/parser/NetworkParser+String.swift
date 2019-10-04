import Foundation

/**
 * String (New with support for Result type)
 */
extension NetworkParser {
   /**
    * Return string for WebPath
    * - Remark: should be added to a bg thread
    * - Remark: For multiple varaiables etc: param1=value1&param2=value2
    * - Remark: Calls are not in any threads. Wrap in background from the caller POV
    * ## Examples:
    * let webPath: String = "https://github.com/stylekit/img/blob/master/playlist.json?raw=true"
    * NetworkParser.str(webPath: webPath) { (string: String?, error: DownloadError?) in
    *    if case .success(let str) = result {
    *       Swift.print("str:  \(str)")
    *    } else if case .failure(let error) = result {
    *       Swift.print("error:  \(String(describing: error))")
    *    }
    * }
    * - Parameter urlStr: (Webpath) i.e: "https://www.google.com/dev/push?=someValue"
    */
   public static func str(urlStr: String, httpMethod: HTTPMethodType = .get, onComplete:@escaping OnStrDownloadComplete = defaultOnStrDownloadComplete) {
      guard let url = URL(string: urlStr) else { onComplete(.failure(.invalidWebPath)); return }
      str(url: url, httpMethod: httpMethod) { result in
         if case .success(let stringAndResponse) = result {
            onComplete(.success(stringAndResponse.string))
         }
      }
   }
   /**
    * Return string for URL
    * ## Examples:
    * NetworkParser.str(url: url)
    * - Remark: Calls are not in any threads. Wrap in background from the caller POV
    * - Note: You can debug more closley with: response?.suggestedFilename and url.lastPathComponent
    */
   public static func str(url: URL, httpMethod: HTTPMethodType = .get, onDownloadComplete:@escaping OnStringDownloadComplete = defaultOnStringDownloadComplete) {
      data(url: url, httpMethod: httpMethod) { result in
         if case .success(let dataAndResponse) = result {
            guard let stringValue = NSString(data: dataAndResponse.data, encoding: String.Encoding.utf8.rawValue) as String? else { onDownloadComplete(.failure(.dataIsNotString)); return }
            onDownloadComplete(.success((stringValue, dataAndResponse.response)))
         }
      }
   }
}
