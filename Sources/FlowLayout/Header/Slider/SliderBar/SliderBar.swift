import UIKit
import Spatial

final class SliderBar: UIView, ConstraintKind {
   // - Fixme: ⚠️️ use anchorAndSize var
   var size: SizeConstraint?
   var anchor: AnchorConstraint?
   override init(frame: CGRect = .zero) {
      super.init(frame: frame)
      backgroundColor = HorView.style.slider.foregroundColor
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
