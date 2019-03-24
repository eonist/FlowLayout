import UIKit
import Spatial

//🏀
//Use the constant to calculate the width or height.
//will only work on items that has frame set on init I think
//or parse the item for the w/h constraints

/**
 * Create
 */
extension SpacingTestView{
   /**
    * Creates horizontal items
    */
   func createVerticalItems() -> [UIView] {
      let size:CGSize = .init(width: 120, height: 48)
      let views:[ConstraintView] = [UIColor.purple,.orange/*,.red,.blue*/].map{
         let view:ConstraintView = .init(frame: .zero)//.init(origin: .zero, size: size)
         self.addSubview(view)
         view.backgroundColor = $0
         return view
      }
      views.applySizes(width: size.width, height: size.height)
      views.applyAnchors(to: self, align: .top , alignTo: .top, offset:20)
      
//      views.distribute(dir: .horizontal)
//      (dir: .hor, width: size.width, height: size.height)
      
//      views.distributeAndSize(dir: .hor, height: size.height, multiplier:.init(width:0.25,height:1), offset:20, sizeOffset:.init(width:-10,height:0))
//      Swift.print("self.bounds.size:  \(self.bounds.size)")
//      let inset:UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
//      views.spaceBetween(dir: .hor, parent: self, inset:.zero)
//      views.spaceBetween(dir: .vertical, parent: self)
      
      views.spaceAround(dir: .hor, parent: self)
//      views.spaceAround(dir: .ver, parent: self)
      return views
   }
}
