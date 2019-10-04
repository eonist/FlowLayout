import Foundation
/**
 * Default callbacks - String (New for Result type)
 */
extension NetworkParser {
   /**
    * Default completion block for string download
    */
   public static var defaultOnStrDownloadComplete: OnStrDownloadComplete = { result in
      if case .success(let string) = result {
         Swift.print("string.count: \(string.count)")
      } else if case .failure(let error) = result {
         Swift.print("error:  \(String(describing: error))") // print(error.localizedDescription)
      }
   }
   /**
    * Default completion block for string download
    */
   public static var defaultOnStringDownloadComplete: OnStringDownloadComplete = { result in
      if case .success(let stringAndResponse) = result {
         Swift.print("string.count: \(stringAndResponse.string.count) response: \(stringAndResponse.response)")
      } else if case .failure(let error) = result {
         Swift.print("error:  \(String(describing: error))") // print(error.localizedDescription)
      }
   }
}
