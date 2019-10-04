import UIKit
import Spatial
/**
 * UI elements
 */
extension CardView {
   /**
    * Creates topBar
    */
   func createTopBar() -> TopBar {
      let topBar: TopBar = .init()
      self.addSubview(topBar)
      topBar.anchorAndSize(to: self, height: TopBar.topBarHeight)
      return topBar
   }
   /**
    * Creates the middle card content view
    */
   func createMiddleContent() -> MiddleContent {
      let middleContent: MiddleContent = .init()
      self.addSubview(middleContent)
      let sizeOffset: CGSize = .init(width: 0, height: -(TopBar.topBarHeight + BottomBar.bottomBarHeight))
      middleContent.anchorAndSize(to: topBar, sizeTo: self, alignTo: .bottomLeft, sizeOffset: sizeOffset)
      return middleContent
   }
   /**
    * Creates bottomBar
    */
   func createBottomBar() -> BottomBar {
      let bottomBar: BottomBar = .init()
      self.addSubview(bottomBar)
      bottomBar.anchorAndSize(to: cardContent, sizeTo: self, height: BottomBar.bottomBarHeight, alignTo: .bottomLeft)
      return bottomBar
   }
}
/**
 * Background & layer
 */
extension CardView {
   /**
    * Creates bg layer
    */
   func createBackgroundLayer() -> CALayer {
      let bgLayer: CALayer = {
         let layer = CALayer()
         layer.backgroundColor = UIColor.green.cgColor
         layer.frame = self.bounds//CGRect.init(x: CardView.margin.left, y: CardView.margin.top, width: self.frame.width - (CardView.margin.left + CardView.margin.right)  , height: self.frame.height - (CardView.margin.top + CardView.margin.bottom))
         return layer
      }()
      self.layer.insertSublayer(bgLayer, at: 0)/*⚠️️ We need to insert bg at 0, or else it is put above all views*/
      return bgLayer
   }
   /**
    * Creates and applies mask to view
    */
   func createMaskLayer() -> CAShapeLayer {
      let maskLayer = CAShapeLayer()
      let path: UIBezierPath = .init(roundedRect: self.bounds, cornerRadius: 24)
      maskLayer.path = path.cgPath
      self.layer.mask = maskLayer/*Applies the mask to the view*/
      return maskLayer
   }
}
