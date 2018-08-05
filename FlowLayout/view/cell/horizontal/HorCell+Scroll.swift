import UIKit
/**
 * Scroll
 */
extension HorCell{
    /**
     * Used to make the NavBar stick to the tableView
     * NOTE: Calls a callback that notifies external UI elements to reposition etc
     * NOTE: You can get the statusBarheight from UIApplication.shared.statusBarFrame.height
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Swift.print("⚠️️ HorCell.scrollViewDidScroll ")
        let y = scrollView.contentOffset.y
        let offsetY:CGFloat = (-1 * y) - Header.height/*offset y starts from 0*/
        if offsetY >= 0 {
            Header.sharedInstance.frame.origin.y = offsetY
        } else if offsetY <= 0 && offsetY >= -(ButtonContainer.height) {
            Header.sharedInstance.frame.origin.y = offsetY
        } else if offsetY <= -(ButtonContainer.height){
            Header.sharedInstance.frame.origin.y = -(ButtonContainer.height)
        } else {/*less than statusbarheight, reset to statusbarheight*/
            Header.sharedInstance.frame.origin.y = 0
        }
    }
}
