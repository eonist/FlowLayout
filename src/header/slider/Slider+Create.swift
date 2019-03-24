import UIKit
import Spatial
import With
/**
 * Create
 */
extension Slider{
   static let height:CGFloat = 10
   var sliderBarWidth:CGFloat {return self.frame.width / CGFloat(segmentCount)}
   /**
    * Creates the slider bar
    */
   func createSliderBar() -> SliderBar {
      let size:CGSize = CGSize.init(width: sliderBarWidth, height: Slider.height)
      return with(.init(frame: CGRect.init(origin: frame.origin, size: size))) {
         addSubview($0)
         $0.applyAnchorAndSize { view in/*Constraints*/
            let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: size)
            return (anchor:anchor, size:size)
         }
      }
   }
}
