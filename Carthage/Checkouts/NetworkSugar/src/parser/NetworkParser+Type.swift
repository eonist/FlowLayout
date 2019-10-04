import Foundation
/**
 * Completion-call-backs
 */
extension NetworkParser {
   //  callback
   public typealias OnStrDownloadComplete = (Result<String, NetworkError>) -> Void
   public typealias OnDataDownloadCompleted = (Result<Data, NetworkError>) -> Void
}
/**
 * Completion-call-backs (With response)
 */
extension NetworkParser {
   public typealias OnStringDownloadComplete = (Result<StringAndResponse, NetworkError>) -> Void
   public typealias OnDataDownloadComplete = (Result<DataAndResponse, NetworkError>) -> Void
}
/**
 * Callback-Data-type
 */
extension NetworkParser {
   public typealias StringAndResponse = (string: String, response: URLResponse)
   public typealias DataAndResponse = (data: Data, response: URLResponse)
}
/**
 * Used for differentiating get from post
 */
extension NetworkParser {
   public enum HTTPMethodType: String { case get = "GET"; case post = "POST" }
}
