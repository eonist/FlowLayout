import UIKit
import Spatial

extension MainView{
   /**
    * Create the FlowView
    */
   func createCardView() -> CardView{
      let view:CardView = CardView()//.init(frame: .init(origin: .zero, size: screenSize))
      self.addSubview(view)
      let offset:CGPoint = .init(x:CardView.margin.left,y:CardView.margin.top)
      let sizeOffset:CGSize = .init(width: -(CardView.margin.left + CardView.margin.right), height: -(CardView.margin.top + CardView.margin.bottom))
      view.anchorAndSize(to: self, offset: offset ,sizeOffset: sizeOffset)
      return view
   }
   /**
    * Create spacing test view
    */
   func createSpacingTestView() -> SpacingTestView{
      let view:SpacingTestView = .init()
      self.addSubview(view)
      view.backgroundColor = .green
//      view.applyAnchorAndSize(to: self)
      view.anchorAndSize(to: self)
      return view
   }
}
