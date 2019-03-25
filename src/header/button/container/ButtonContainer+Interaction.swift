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
      if let headerBtn = sender as? HeaderButton, let headerTitle = headerBtn.currentTitle, let cellType = HorView.CellType(rawValue: headerTitle) {
         let idx:Int = cellType.idx//0,1,2
         ((self.superview as? Header)?.superview as? HorView)?.setIdx(idx: idx)
         //            setIdx(idx: 0)
         setActive(btn: headerBtn)
         //setIdx(idx: idx)
      }
   }
   
}

