import UIKit
/**
 * Scroll
 */
extension HorCell{
   /**
    * Used to make the NavBar stick to the tableView
    * - Note: Calls a callback that notifies external UI elements to reposition etc
    * - Note: You can get the statusBarheight from UIApplication.shared.statusBarFrame.height
    * - TODO: ⚠️️ This logic could/should be moved to parent by using a call-back method instead
    */
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let y = scrollView.contentOffset.y
      let offsetY:CGFloat = (-1 * y) - Header.height/*offset y starts from 0*/
      let retVal:CGFloat = {
         if offsetY >= 0 {
            return offsetY // Header.sharedInstance.frame.origin.y = offsetY
         } else if offsetY <= 0 && offsetY >= -(ButtonContainer.height) {
            return  offsetY // Header.sharedInstance.frame.origin.y = offsetY
         } else if offsetY <= -(ButtonContainer.height){
            return -(ButtonContainer.height) //            Header.sharedInstance.frame.origin.y = -(ButtonContainer.height)
         } else {/*less than statusbarheight, reset to statusbarheight*/
            return 0 // Header.sharedInstance.frame.origin.y = 0
         }
      }()
      onTableViewScrollCallBack(retVal)
   }
}
