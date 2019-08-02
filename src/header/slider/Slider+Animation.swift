import UIKit
/**
 * Animation
 */
extension Slider {
   typealias OnComplete = () -> Void
   /**
    * - Parameter: to: the amount to offset in the X dir
    * - Parameter: onComplete: called when the animation completes
    */
   func animate(to: CGFloat, onComplete:@escaping OnComplete = {}) {
      Swift.print("animate: \(to)")
      UIView.animate({/*Animate*/
         self.setProgress(to: to)
         self.layoutIfNeeded()
      }, onComplete: onComplete)
   }
}
