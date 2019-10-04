import UIKit
import Spatial

class AnimationTest: UIView {
   lazy var button: Button = createButton()
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .green
      _ = button
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
