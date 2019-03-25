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
//      Swift.print("Slider.setIdx: \(idx)")
      let sliderBarWidth:CGFloat = {return self.frame.width / CGFloat(segmentCount)}()
      let x:CGFloat = sliderBarWidth * CGFloat(idx)
      animate(to: x)
   }
   /**
    * Set progress
    */
   func setProgress(progress:CGFloat){
//      Swift.print("setProgress: \(progress)")
      let sliderBarWidth:CGFloat = {return self.frame.width / CGFloat(segmentCount)}()
      let x:CGFloat = sliderBarWidth * progress
      setProgress(to: x)
   }
   /**
    *
    */
   func setProgress(to:CGFloat){
//      Swift.print("setProgress.to:  \(to)")
      self.sliderBar.update(offset: to, align: .left, alignTo: .left)
   }
}
