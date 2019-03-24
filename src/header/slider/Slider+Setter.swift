import UIKit
import Spatial
/**
 * Accesor
 */
extension Slider{
   /**
    * Set index
    */
   func setIdx(idx:Int){
      Swift.print("Slider.setIdx: \(idx)")
      let x:CGFloat = sliderBarWidth * CGFloat(idx)
      animate(to: x)
   }
   /**
    * Set progress
    */
   func setProgress(progress:CGFloat){
      Swift.print("setProgress: \(progress)")
      let x:CGFloat = sliderBarWidth * progress
      setProgress(to: x)
   }
   /**
    *
    */
   func setProgress(to:CGFloat){
      Swift.print("setProgress.to:  \(to)")
      let newConstraintClosure = {/*Animate to this*/
         guard let anchor = self.sliderBar.anchor else {fatalError("err anchor not available")}
         NSLayoutConstraint.deactivate([anchor.x])/*Deactivate the current active constraint*/
         let xConstraint = Constraint.anchor(self.sliderBar, to: self, align: .left, alignTo: .left, offset: to)
         NSLayoutConstraint.activate([xConstraint/*,pos.y*/])
         self.sliderBar.anchor?.x = xConstraint
      }
      newConstraintClosure()/*Set the new constraints*/
   }
}
