import Foundation
/**
 * Handler
 */
extension ButtonContainer {
   /**
    * click
    */
   @objc func onTouchInside(sender:UIButton) {
      Swift.print("ButtonContainer.onTouchInside ")
      /*The bellow converts button to index*/
      
      if let headerBtn = sender as? HeaderButton, let headerTitle = headerBtn.currentTitle {
         onButtonClick(headerTitle)
      }
   }
}
