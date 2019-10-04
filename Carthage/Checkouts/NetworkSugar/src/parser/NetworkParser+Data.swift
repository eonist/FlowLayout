#if os(OSX)
import AppKit.NSView
#else
import UIKit.UIView
#endif
/**
 * Data (New - Supports Result type)
 */
public class NetworkParser {
   /**
    * Get Data from urlStr (WebPath)
    * - Note: Calls are not in any threads. Wrap in background from the caller
    * ## Examples:
    * let webPath: String = "https://github.com/stylekit/img/blob/master/playlist.json?raw=true"
    * NetworkParser.str(webPath: webPath) { (data: Data?, error: DownloadError?) in
    *    if case .success(let data) = result {
    *       Swift.print("data.count:  \(data.count)")
    *    } else if case .failure(let error) = result {
    *       Swift.print("error:  \(String(describing: error))")
    *    }
    * }
    */
   public static func data(urlStr: String, httpMethod: HTTPMethodType = .get, onComplete:@escaping OnDataDownloadCompleted = defaultOnDataCompleted) {
      guard let url = URL(string: urlStr) else { onComplete(.failure(.invalidWebPath)); return }
      data(url: url, httpMethod: .get, httpBody: nil) { result in
         if case .success(let dataAndResponse) = result {
            onComplete(.success(dataAndResponse.data))
         }
      }
   }
   /**
    * Get Data from URL
    * ## Examples:
    * NetworkParser.data(url: url)
    * - Note: this one-liner also works: URLSession.shared.dataTask(with: url) { data, response, error in completion(data, response, error) }.resume()
    * - Note: For multiple varaiables etc: param1=value1&param2=value2
    * - Note: Calls are not in any threads. Wrap in background from the caller POV
    * - Parameter urlStr: "https://www.google.com/dev/push?tx=someValue"
    * - Parameter httpBody: some servers requires the params to be encoded as data
    */
   public static func data(url: URL, httpMethod: HTTPMethodType = .get, httpBody: Data? = nil, completion: @escaping OnDataDownloadComplete = defaultOnDataComplete) {
      var urlRequest: URLRequest = .init(url: url)
      urlRequest.httpMethod = httpMethod.rawValue // get or post
      if let httpBody = httpBody { urlRequest.httpBody = httpBody }
      data(urlRequest: urlRequest, onComplete: completion)
   }
   /**
    * Get data
    * - Note: Used for Custom URLRequests
    * - Note: Calls are not made in background thread. Wrap in background thread from the caller
    */
   public static func data(urlRequest: URLRequest, onComplete: @escaping OnDataDownloadComplete) {
      let session: URLSession = .shared
      let task: URLSessionTask = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
         guard let response = response else { onComplete(.failure(.responseIsNil)); return }
         if let error = error {
            let err: NetworkError = .errorGettingDataFromURL(error, response)
            onComplete(.failure(err))
         } else {
            guard let data = data else { onComplete(.failure(.dataIsNil)); return }
            onComplete(.success((data, response)))
         }
      }
      task.resume()
   }
}
