import UIKit
import Spatial
/**
 * Accessor
 */
extension Header {
   /**
    * Set index
    */
   func setIdx(idx:Int){
      Swift.print("Header.setIdx")
      //slider.setIdx(idx: idx)
      //setTitleIdx(idx: idx)
   }
   /**
    * Set index for title label
    */
   func setTitleIdx(idx:Int){
      let title:String = HorView.CellType.fromHashValue(hashValue: idx)?.rawValue ?? "undefined"
      headerTitle.text = title
   }
}
