#if os(iOS)
import UIKit
/**
 * Handler
 */
extension ButtonContainer {
   /**
    * Tap
    */
   @objc func onTouchInside(sender: UIButton) {
      if let headerBtn = sender as? HeaderButton, let headerTitle = headerBtn.currentTitle {
         onButtonClick(headerTitle)
      }
   }
}

#endif
