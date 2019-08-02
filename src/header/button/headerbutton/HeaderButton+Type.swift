import Foundation
/**
 * Type
 */
extension HeaderButton {
   typealias ClickCallBack = () -> Void
   static var defaultClickCallBack = { Swift.print("HeaderButton.defaultClickCallBack() - no call back attached") }
}
