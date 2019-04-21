import UIKit
import Spatial
import With
/**
 * Create
 */
extension Slider{
   static let height: CGFloat = 10
   /**
    * Creates the slider bar
    */
   func createSliderBar() -> SliderBar {
      return with(.init(frame: .zero)) {
         addSubview($0)
         let sliderWidthMultiplier: CGFloat = 1 / CGFloat(segmentCount)
         $0.applyAnchorAndSize(to: self, height:Slider.height, align: .topLeft, alignTo: .topLeft, multiplier:.init(width:sliderWidthMultiplier, height:1))
      }
   }
}
