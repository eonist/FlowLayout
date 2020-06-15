import UIKit
/**
 * Event
 */
extension HorView {
   /**
    * On vertical scroll callback
    * 1. Make Header-Button-Container stick to top
    * 2. Make Header stick to downward movement
    * 3. Allow Table to slide under Header
    */
   func onVerticalScroll(yOffset: CGFloat) {
      let y: CGFloat = (-1 * yOffset) - Header.height // offset y starts from 0 (easier to reason about)
      let headerY: CGFloat = {
         if y <= 0 && y >= -HeaderTitle.height { return y } // if y is negative, and y is within -HeaderTitle.height
         else if y < -HeaderTitle.height { return -HeaderTitle.height } // if y is beyond -Header.height, then only hide header-title
         else { return y } // if y is possetive, then set headerY directly
      }()
      self.header.frame.origin.y = headerY // - Fixme: ⚠️️ rather use Autolayout to update this
   }
}
