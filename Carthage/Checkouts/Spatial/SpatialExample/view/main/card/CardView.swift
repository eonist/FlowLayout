import UIKit

class CardView: UIView {
   /*Graphics*/
   lazy var backgroundLayer: CALayer = createBackgroundLayer()
   lazy var maskLayer: CAShapeLayer = createMaskLayer()
   /*UI*/
   lazy var topBar: TopBar = createTopBar()
   lazy var cardContent: MiddleContent = createMiddleContent()
   lazy var bottomBar: BottomBar = createBottomBar()
   override init(frame: CGRect) {
      super.init(frame: frame)
      /*UI*/
      _ = topBar
      _ = cardContent
      _ = bottomBar
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   /**
    * We create graphics elements in the layoutSubViews method since we need to access the .frame in these UI elements
    */
   override func layoutSubviews() {
      super.layoutSubviews()
      self.backgroundColor = .gray
      /*Graphics*/
      _ = backgroundLayer
      _ = maskLayer
   }
}
