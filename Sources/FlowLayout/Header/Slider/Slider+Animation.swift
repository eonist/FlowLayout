import UIKit
/**
 * Animation
 */
extension Slider {
   typealias OnComplete = () -> Void
   /**
    * - Parameters:
    *   - to: the amount to offset in the X dir
    *   - onComplete: called when the animation completes
    */
   func animate(to: CGFloat, onComplete:@escaping OnComplete = {}) {
      Swift.print("Slider.animate: \(to)")
      UIView.animate({ // Animate
         self.setProgress(to: to)
         self.layoutIfNeeded()
      }, onComplete: onComplete)
   }
}
