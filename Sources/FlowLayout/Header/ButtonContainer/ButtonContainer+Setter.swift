import UIKit

extension ButtonContainer {
   /**
    * Set index
    */
   func setIdx(idx: Int) {
      // Swift.print("BtnContainer.setIdx(\(idx))")
      let btnTitle: String? = ColumnCellType.allCases[idx].rawValue.capitalized
      // Swift.print("btnTitle:  \(String(describing: btnTitle))")
      buttons.filter { $0.titleLabel?.text == btnTitle }.forEach { setActive(btn: $0) }
   }
   /**
    * Set active state
    */
   func setActive(btn: UIButton) {
      // Swift.print("setActive:  \(String(describing: setActive))")
      buttons.forEach { $0.setActive(isActive: $0 == btn) }
   }
}
