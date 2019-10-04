import UIKit
/**
 * Typalias
 */
extension UIImageView {
   public typealias OnError = (UIImage.IMGError?) -> Void
}
/**
 * Defaults
 */
extension UIImageView {
   public static var defaultErrorHandler: OnError = { err in
      Swift.print("img error:  \(String(describing: err))")
   }
}
