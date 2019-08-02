import UIKit
import Spatial

class ItemView: UIView {
   lazy var horizontalItems: [UIView] = createHorizontalItems()
   override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .green
      _ = horizontalItems
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
