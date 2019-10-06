import Foundation
/**
 * Const
 */
extension HeaderButton {
   static var defautOnTap: OnTap = { Swift.print("HeaderButton.defaultClickCallBack() - no call back attached") }
   static let width: CGFloat = 60
   static let height: CGFloat = 20 // Fixme: combine width and height to size
}
