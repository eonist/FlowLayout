import Foundation
/**
 * Error (New with support for ResultType)
 * - Fixme: ⚠️️ Split the error into other errors, or sub errors related to their call
 */
extension NetworkParser {
   public enum NetworkError: Error {
      case invalidWebPath // The url-path is not convertable to an URL instance
      case dataIsNotString // The data instance is not convertiable to string
      case dataIsNil // The data returned is nil
      case responseIsNil // There was no response
      case errorGettingDataFromURL(Error, URLResponse) // data was void, pass on error and response
   }
}
