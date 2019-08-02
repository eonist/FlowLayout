import UIKit
import Spatial

extension MainView {
   /**
    * Create the FlowView
    */
   func createCardView() -> CardView {
      let view: CardView = .init()//.init(frame: .init(origin: .zero, size: screenSize))
      self.addSubview(view)
      let offset: CGPoint = .init(x:CardView.margin.left, y:CardView.margin.top)
      let sizeOffset: CGSize = .init(width: -(CardView.margin.left + CardView.margin.right), height: -(CardView.margin.top + CardView.margin.bottom))
      view.anchorAndSize(to: self, offset: offset, sizeOffset: sizeOffset)
      return view
   }
   /**
    * Create spacing test view
    */
   func createSpacingTestView() -> SpacingTestView {
      let view: SpacingTestView = .init()
      self.addSubview(view)
      view.backgroundColor = .green
      //      view.applyAnchorAndSize(to: self)
      view.anchorAndSize(to: self)
      return view
   }
   /**
    * Test minimums
    */
   func createMinMaxView() -> MinMaxTestView {
      let view: MinMaxTestView = .init()
      self.addSubview(view)
      view.backgroundColor = .lightGray
      view.anchorAndSize(to: self, height: 120)
      return view
   }
   /**
    *
    */
   func createTestView() -> TestView {
      let view: TestView = .init()
      self.addSubview(view)
      view.backgroundColor = .lightGray
      view.anchorAndSize(to: self, height: 120)
      return view
   }
   /**
    *
    */
   func createTableView() -> UIView {
      let view: CustomTableView = .init(rowData: ["Alpha", "Beta", "Ceta", "Delta", "Setta"], frame: .zero, style: .grouped)
      self.addSubview(view)
      view.backgroundColor = .lightGray
      view.anchorAndSize(to: self/*, height:120*/)
      return view
   }
}
