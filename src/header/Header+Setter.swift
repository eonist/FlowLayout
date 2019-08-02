import UIKit
import Spatial
/**
 * Accessor
 */
extension Header {
   /**
    * Set index
    */
   func setIdx(idx: Int) {
      Swift.print("Header.setIdx - ⚠️️  out of order ⚠️️ ")
      //slider.setIdx(idx: idx)
      //setTitleIdx(idx: idx)
   }
   /**
    * Set index for title label
    */
   func setTitleIdx(idx: Int) {
      let title: String = HorView.CellType.allCases[idx].rawValue //?? "undefined"
      headerTitle.text = title
   }
}
