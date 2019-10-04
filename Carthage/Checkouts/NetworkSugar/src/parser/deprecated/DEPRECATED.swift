import Foundation
#if os(OSX)
import AppKit.NSView
#else
import UIKit.UIView
#endif
public class LegacyNetworkParser {}
/**
 * Type
 */
extension LegacyNetworkParser {
   public typealias DownloadComplete = (String?, DownloadError?) -> Void
   public typealias DataDownloadComplete = (Data?, DownloadError?) -> Void
   public typealias URLQuery = (Data?, URLResponse?, Error?) -> Void
}
/**
 * Default callbacks
 */
extension LegacyNetworkParser {
   /**
    * Default completetion block for download
    */
   public static var defaultDownloadComplete: DownloadComplete = { (string: String?, error: DownloadError?) in
      if let str = string {
         Swift.print("str:  \(str)")
      } else {
         Swift.print("error:  \(String(describing: error))")
      }
   }
   /**
    * Default callback method for data(url: URL)
    */
   public static var defaultURLQueryComplete: URLQuery = { (data: Data?, response: URLResponse?, error: Error?) in
      if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
         Swift.print("str:  \(str)")
      } else {
         Swift.print("error:  \(String(describing: error)) response: \(String(describing: response))")
      }
   }
   /**
    * Default callback method for data(webPath:String) call
    */
   public static var defaultDataComplete: DataDownloadComplete = { (data: Data?, error: DownloadError?) in
      if let data = data, let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
         Swift.print("str:  \(str)")
      } else {
         Swift.print("error:  \(String(describing: error))")
      }
   }
}
/**
 * Data
 */
extension LegacyNetworkParser {
   /**
    * Get Data from urlStr (WebPath)
    * ## Examples:
    * let webPath: String = "https://github.com/stylekit/img/blob/master/playlist.json?raw=true"
    * NetworkParser.str(webPath: webPath) { (data: Data?, error: DownloadError?) in
    *    if let data = data {
    *       Swift.print("data.count:  \(data.count)")
    *    } else {
    *       Swift.print("error:  \(String(describing: error))")
    *    }
    * }
    * - Remark: Calls are not in any threads. Wrap in background from the caller
    */
   public static func data(urlStr: String, onComplete:@escaping DataDownloadComplete = defaultDataComplete) {
      guard let url = URL(string: urlStr) else { onComplete(nil, .invalidWebPath); return }
      data(url: url) { data, response, error in
         guard let data = data, error == nil else { onComplete(nil, .errorGettingDataFromURL(error, response)); return }
         onComplete(data, nil)
      }
   }
   /**
    * Get Data from URL
    * ## Examples:
    * NetworkParser.data(url: url)
    * - Note: this one-liner also works: URLSession.shared.dataTask(with: url) { data, response, error in completion(data, response, error) }.resume()
    * - Note: For multiple varaiables etc: param1=value1&param2=value2
    * - Parameter urlStr:"https://www.google.com/dev/push?tx=someValue"
    * - Parameter httpBody: some servers requires the params to be encoded as data
    * - Remark: Calls are not in any threads. Wrap in background from the caller POV
    */
   public static func data(url: URL, httpMethod: NetworkParser.HTTPMethodType = .get, httpBody: Data? = nil, completion: @escaping URLQuery = defaultURLQueryComplete) {
      var urlRequest: URLRequest = .init(url: url)
      urlRequest.httpMethod = httpMethod.rawValue // get or post
      if let httpBody = httpBody { urlRequest.httpBody = httpBody }
      data(urlRequest: urlRequest, completion: completion)
   }
   /**
    * - Note: Used for Custom URLRequests
    * - Remark: Calls are not made in background thread. Wrap in background thread from the caller
    */
   public static func data(urlRequest: URLRequest, completion: @escaping URLQuery = defaultURLQueryComplete) {
      let session: URLSession = .shared
      let task: URLSessionTask = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
         completion(data, response, error)
      }
      task.resume()
   }
}
/**
 * String
 */
extension LegacyNetworkParser {
   /**
    * Return string for WebPath
    * - Remark: should be added to a bg thread
    * - Remark: For multiple varaiables etc: param1=value1&param2=value2
    * - Remark: Calls are not in any threads. Wrap in background from the caller POV
    * ## Examples:
    * let webPath: String = "https://github.com/stylekit/img/blob/master/playlist.json?raw=true"
    * NetworkParser.str(webPath: webPath) { (string: String?, error: DownloadError?) in
    *    if let str = string {
    *       Swift.print("str:  \(str)")
    *    } else {
    *       Swift.print("error:  \(String(describing: error))")
    *    }
    * }
    * - Parameter urlStr: (Webpath) i.e: "https://www.google.com/dev/push?=someValue"
    */
   public static func str(urlStr: String, httpMethod: NetworkParser.HTTPMethodType = .get, onComplete:@escaping DownloadComplete = defaultDownloadComplete) {
      guard let url = URL(string: urlStr) else { onComplete(nil, .invalidWebPath); return }
      str(url: url, httpMethod: httpMethod, downloadComplete: onComplete)
   }
   /**
    * Return string for URL
    * ## Examples:
    * NetworkParser.str(url: url)
    * - Remark: Calls are not in any threads. Wrap in background from the caller POV
    * - Note: You can debug more closley with: response?.suggestedFilename and url.lastPathComponent
    */
   public static func str(url: URL, httpMethod: NetworkParser.HTTPMethodType = .get, downloadComplete:@escaping DownloadComplete = defaultDownloadComplete) {
      data(url: url, httpMethod: httpMethod) { data, response, error in
         guard let data = data, error == nil else { downloadComplete(nil, .errorGettingDataFromURL(error, response)); return }
         guard let stringValue = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? else { downloadComplete(nil, .dataIsNotString); return }
         downloadComplete(stringValue, nil)
      }
   }
}
/**
 * Extra
 */
extension LegacyNetworkParser {
   public enum DownloadError: Error {
      case invalidWebPath
      case dataIsNotString
      case dataIsNil
      case responseIsNil
      case errorGettingDataFromURL(Error?, URLResponse?)
   }
}
