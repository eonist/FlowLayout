import UIKit
/**
 * Scroll
 */
extension HorCell {
   /**
    * Used to make the NavBar stick to the tableView
    * - Note: Calls a callback that notifies external UI elements to reposition etc
    * - Note: You can get the statusBarheight from UIApplication.shared.statusBarFrame.height
    * - Fixme: ⚠️️ This logic could/should be moved to parent by using a call-back method instead
    */
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let y = scrollView.contentOffset.y
      let offsetY: CGFloat = (-1 * y) - Header.height/*offset y starts from 0*/
      let retVal: CGFloat = {
         if offsetY >= 0 { return offsetY }
         else if offsetY <= 0 && offsetY >= -(ButtonContainer.height) { return offsetY }
         else if offsetY <= -(ButtonContainer.height) { return -(ButtonContainer.height) } // Header.sharedInstance.frame.origin.y = -(ButtonContainer.height)
         else { return 0 }/*less than statusbarheight, reset to statusbarheight*/
      }()
      onScroll( retVal )
   }
}
