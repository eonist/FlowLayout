import UIKit
import Spatial
/**
 * Accesor
 */
extension Slider {
   /**
    * Sets index
    */
   func setIdx(idx: Int) {
      let sliderBarWidth: CGFloat = self.frame.width / CGFloat(segmentCount)
      let x: CGFloat = sliderBarWidth * CGFloat(idx)
      animate(to: x)
   }
   /**
    * Set progress
    * - Parameter progress: 0 - 1
    */
   func setProgress(progress: CGFloat) {
      let sliderBarWidth: CGFloat = { self.frame.width / CGFloat(segmentCount) }()
      let x: CGFloat = sliderBarWidth * progress
      setProgress(to: x)
   }
   /**
    * - Parameter to: the x-position to set to
    */
   func setProgress(to: CGFloat) {
      self.sliderBar.update(offset: to, align: .left, alignTo: .left)
   }
}
