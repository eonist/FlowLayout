#if os(iOS)
import UIKit
/**
 * Animation
 * - Description: These are examples how you can animate with Spatial and autolayout
 * - Todo: ⚠️️ Use animation classes that support earlier versions of iOS
 * - Todo: ⚠️️ Use UIViewConstraintKind?
 */
extension ConstraintKind where Self: UIView {
   /**
    * Animates a UIView that adhers to ConstraintKind (hor)
    * ## Examples:
    * btn.animate(to:100,align:left,alignTo:.left)
    */
   public func animate(to: CGFloat, align: HorizontalAlign, alignTo: HorizontalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete) {
      UIView.animate({
         self.update(offset: to, align: align, alignTo: alignTo)
      }, onComplete: onComplete)
   }
   /**
    * Anim (ver)
    */
   public func animate(to: CGFloat, align: VerticalAlign, alignTo: VerticalAlign, onComplete:@escaping AnimComplete = Self.defaultOnComplete) {
      UIView.animate({
         self.update(offset: to, align: align, alignTo: alignTo)
      }, onComplete: onComplete)
   }
   /**
    * Anim (ver,hor)
    */
   public func animate(to: CGPoint, align: Alignment, alignTo: Alignment, onComplete:@escaping AnimComplete = Self.defaultOnComplete) {
      UIView.animate({
         self.update(offset: to, align: align, alignTo: alignTo)
      }, onComplete: onComplete)
   }
}
/**
 * Animation (Static & convenient)
 */
extension UIView {
   public typealias AnimComplete = () -> Void
   public typealias AnimUpdate = () -> Void
   public static func defaultOnComplete() { Swift.print("default anim completed closure") }
   /**
    * Animate
    * - Paramater onUpdate: is "animateTo this" and on every frame do this at the same time 🤔
    * - Fixme: ⚠️️ Add dur and curve to method
    */
   public static func animate(_ onUpdate:@escaping AnimUpdate, onComplete:@escaping AnimComplete = UIView.defaultOnComplete, dur: Double = 0.3, easing: AnimationCurve = .easeOut) {
      let anim: UIViewPropertyAnimator = .init(duration: dur, curve: easing, animations: {
         onUpdate()
      })
      anim.addCompletion { _ in onComplete() }
      anim.startAnimation()
   }
}
#endif
