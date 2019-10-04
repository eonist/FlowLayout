#if os(OSX)
import AppKit.NSImage
#else
import UIKit.UIImage
#endif
/**
 * Typealias, Error-type
 */
extension UIImage {
  public typealias DownloadComplete = (UIImage?, IMGError?) -> Void
  public enum IMGError: Error {
      case invalideWebPath
      case imageDataIsCorrupted
      case errorGettingDataFromURL
   }
}
