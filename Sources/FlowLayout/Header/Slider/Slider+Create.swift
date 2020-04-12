import UIKit
import Spatial
import With
/**
 * Create
 */
extension Slider {
   /**
    * Creates the slider bar
    */
   func createSliderBar() -> SliderBar {
      with(.init()) {
         addSubview($0)
         let sliderWidthMultiplier: CGFloat = 1 / CGFloat(segmentCount)
         $0.applyAnchorAndSize(to: self, height: Slider.height, align: .topLeft, alignTo: .topLeft, multiplier: .init(width: sliderWidthMultiplier, height: 1))
      }
   }
}
