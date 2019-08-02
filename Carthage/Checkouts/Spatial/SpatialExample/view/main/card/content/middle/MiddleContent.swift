import UIKit
import Spatial

class MiddleContent: UIView {
   lazy var itemViews: [ItemView] = createItemViews()
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .yellow
      _ = itemViews
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
