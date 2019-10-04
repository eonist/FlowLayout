import UIKit
import Spatial

extension MiddleContent {
   /**
    * Create items
    */
   func createItemViews() -> [ItemView] {
      let size: CGSize = .init(width: self.frame.width, height: 48)
      let itemViews: [ItemView] = (0..<5).map {_ in
         let itemView: ItemView = .init(frame: .zero)
         self.addSubview(itemView)
         return itemView
      }
      itemViews.activateAnchorsAndSizes { views in /*All vertically centered, 48p height each*/
         let anchors = Constraint.distribute(vertically: views, align: .topLeft, spacing: 12, offset: 24)
         let sizes = views.map { Constraint.size($0, size: size) }
         return (anchors, sizes)
      }
      return itemViews
   }
}
