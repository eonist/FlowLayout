
import UIKit

extension HorCell{
    /**
     * Used to make the NavBar stick to the tableView
     * NOTE: calls a callback that notifies external UI elements to reposition etc
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        Swift.print("⚠️️ HorCell.scrollViewDidScroll ")
        let y = scrollView.contentOffset.y
        Swift.print("y :  \(y )")
        let h = scrollView.bounds.size.height
        let currentProgress = ((y/h))
        Swift.print("currentProgress:  \(currentProgress)")
        
//        let statusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.height
//        let offsetY:CGFloat = (-1 * y) - Header.height//offset y starts from 0.
//        Swift.print("offsetY:  \(offsetY)")
//        if y >= -Header.height {
//            Swift.print("Header.sharedInstance:  \(Header.sharedInstance)")
//            Header.sharedInstance.frame.origin.y = -y + Header.height
////            self.topBar.alpha = (50 - (offsetY-statusBarHeight))/50//50 is just arbitrary, can be 60 or 100
//        }
        
        let offsetY:CGFloat = (-1 * y) - Header.height//offset y starts from 0.
        Swift.print("offsetY:  \(offsetY)")
        
//        let buttonContainerHeight:CGFloat =

        if offsetY >= 0 {
            Header.sharedInstance.frame.origin.y = offsetY
//            self.topBar.alpha = (50 - (offsetY-0))/50//50 is just arbitrary, can be 60 or 100
        } else if offsetY <= 0 && offsetY >= -(ButtonContainer.height) {
            Header.sharedInstance.frame.origin.y = offsetY /*+ ButtonContainer.height*/
        } else if offsetY <= -(ButtonContainer.height){
            Header.sharedInstance.frame.origin.y = -(ButtonContainer.height)
        } else {/*less than statusbarheight, reset to statusbarheight*/
            Header.sharedInstance.frame.origin.y = 0
//            self.topBar.alpha = 1
        }
        
        
        
        
//        if
        
//        else{//less than statusbarheight, reset to statusbarheight
//            Header.sharedInstance.frame.origin.y = 0//statusBarHeight
////            self.topBar.alpha = 1
//        }
//        if (-1 * y) <= statusBarHeight {
//            (UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow)?.frame.origin.y = -statusBarHeight + (-1 * y)
//        }else {//more, reset pos
//            (UIApplication.shared.value(forKey: "statusBarWindow") as? UIWindow)?.frame.origin.y = 0
//        }
    }
}

//onTableViewScrollCallBack(self.contentOffset.y)



//
//extension HorView{
//    /**
//     * Called when the user scrolls the tableview (Gets called from tableview)
//     * PURPOUSE: to hide statusbar, and make navbar stick to the tabletop
//     * WARNING: ⚠️️ This looks complicated, and it is. This interaction is complex.
//     */
//    func onTableViewScrollCallBack(_ y:CGFloat){
//
//    }
//}
