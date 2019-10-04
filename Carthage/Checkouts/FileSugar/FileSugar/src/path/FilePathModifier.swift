import Foundation
/**
 * There is also tildify which makes file paths user agnostic (~ instad of hardocded user)
 */
public class FilePathModifier {
   /**
    * ## Examples:
    * FilePathModifier.normalize("/Users/John/Desktop/temp/../test.txt".tildePath)///Users/John/Desktop/test.txt
    */
   public static func normalize(_ urlStr: String) -> String? {
      guard let url: URL = FilePathParser.path(urlStr) else { return nil }
      let normalizedURL: URL = url.standardized
      return FilePathParser.path(normalizedURL)
   }
}
#if os(OSX)
import Cocoa
extension FilePathModifier {
   /**
    * - Parameter baseURL: must be absolute: "Users/John/Desktop/temp"
    * - Return asolute paths aka: Users/John/... (use path.tildify to make them user agnostic)
    * ## Examples:
    * Swift.print(expand("/Users/John/Desktop/temp"))///Users/John/Desktop/temp
    * Swift.print(expand("~/Desktop/test.txt"))///Users/John/Desktop/test.txt
    * Swift.print(expand("/temp/colors/star.svg",baseURL:"/Users/John/Desktop"))///Users/John/Desktop/temp/colors/star.svg
    * Swift.print(expand("star.svg",baseURL:"/Users/John/Desktop"))///Users/John/Desktop/star.svg
    * - Important: ⚠️️ Tilde paths can't have backlash syntax like ../../ etc
    */
   public static func expand(_ filePath: String, baseURL: String = "") -> String? {
      switch true {
      case FilePathAsserter.isTildePath(filePath):
         return filePath.tildePath
      case FilePathAsserter.isBacklash(filePath): // isRelative
         let baseURL = baseURL.hasSuffix("/") ? baseURL : baseURL + "/"
         return FilePathModifier.normalize(baseURL + filePath) // returns absolute path
      case FileAsserter.exists(path: filePath): // absolute path that exists
         return filePath
      case FilePathAsserter.isAbsolute(filePath): // absolute but doesn't exists
         return baseURL + filePath
      default: // must be just Ie: "star.svg"
         let baseURL = baseURL.hasSuffix("/") ? baseURL : baseURL + "/"
         return baseURL + filePath
      }
   }
}
#endif
