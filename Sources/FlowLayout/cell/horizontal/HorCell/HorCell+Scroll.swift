import UIKit
/**
 * Scroll
 */
extension HorCell {
   /**
    * Used to make the NavBar stick to the tableView
    * - Note: Calls a callback that notifies external UI elements to reposition etc
    * - Note: You can get the statusBarheight from UIApplication.shared.statusBarFrame.height if you also want to hide the statusbar
    */
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      onScroll(scrollView.contentOffset.y)
   }
}
