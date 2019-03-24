import UIKit

class MainView:UIView {
   lazy var cardView:CardView = createCardView()
   lazy var spacingTestView:UIView = createSpacingTestView()
   override func layoutSubviews() {
      super.layoutSubviews()
//      _ = cardView
      _ = spacingTestView
   }
}
