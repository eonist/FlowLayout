import Foundation
/**
 * Handler
 */
extension ButtonContainer {
   /**
    * Click
    */
   @objc func onTouchInside(sender: UIButton) {
//      Swift.print("ButtonContainer.onTouchInside ")
      if let headerBtn = sender as? HeaderButton, let headerTitle = headerBtn.currentTitle {
         onButtonClick(headerTitle)
      }
   }
}
