import UIKit
import Spatial
/**
 * Accessor
 */
extension Header {
   /**
    * Set index for title label
    */
   func setTitleIdx(idx: Int) {
      let title: String = HorView.CellType.allCases[idx].rawValue //?? "undefined"
      headerTitle.text = title
   }
}
