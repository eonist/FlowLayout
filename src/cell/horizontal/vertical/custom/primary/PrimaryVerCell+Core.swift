import UIKit
import With
/**
 * Core
 */
extension PrimaryVerCell {
   /**
    * IF the view is redrawn then this is called
    */
   override func layoutSubviews() {
      super.layoutSubviews()
      drawCircle()
   }
   /**
    * Adds a UIView that is round
    * - Fixme: ⚠️️ Use CGShapeUtil and draw a circle instead, faster and more performant
    */
   func drawCircle() {
      let rect: CGRect = .init(origin: .zero, size: .init(width: self.frame.width, height: self.frame.width))
      self.subviews.first?.removeFromSuperview()/*Remove previouse graphics if it exists*/
      with(UIView(frame: rect)) {
         $0.layer.cornerRadius = self.frame.width / 2
         $0.layer.masksToBounds = true
         $0.backgroundColor = UIColorParser.random
         addSubview($0)
      }
   }
}
