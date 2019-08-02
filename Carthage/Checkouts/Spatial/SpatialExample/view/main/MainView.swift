import UIKit

class MainView: UIView {
   lazy var cardView: CardView = createCardView()
   lazy var spacingTestView: UIView = createSpacingTestView()
   lazy var minMaxTestView: UIView = createMinMaxView()
   lazy var testView: UIView = createTestView()
   lazy var tableTestView: UIView = createTableView()
   override init(frame: CGRect) {
      super.init(frame: frame)
      //_ = minMaxTestView
      _ = tableTestView
      //_ = testView
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
