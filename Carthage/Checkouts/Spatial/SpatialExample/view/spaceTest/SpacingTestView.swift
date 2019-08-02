import UIKit
import Spatial

class SpacingTestView: UIView {
   lazy var verticalItems: [UIView] = createVerticalItems()
   override func layoutSubviews() {
      super.layoutSubviews()
      _ = verticalItems
   }
}
