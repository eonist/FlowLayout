import UIKit
import Spatial

extension ItemView {
   /**
    * Creates horizontal items
    */
   func createHorizontalItems() -> [UIView] {
      let size: CGSize = .init(width: 48, height: 48)
      let views: [UIView] = [UIColor.purple, .orange, .red, .blue].map {
         let view: UIView = .init(frame: .zero)
         self.addSubview(view)
         view.backgroundColor = $0
         return view
      }
      views.activateAnchorsAndSizes { views in
         let anchors = Constraint.distribute(horizontally: views, align: .centerLeft)
         let sizes = views.map { Constraint.size($0, size: size) }
         return (anchors, sizes)
      }
      return views
   }
}
