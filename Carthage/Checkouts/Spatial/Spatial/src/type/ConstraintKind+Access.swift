
import Foundation
/**
 * Update constraints (For items that are of type ConstraintKind)
 * NOTE: adding a method called activateConstraints doesn't make any sense because you have only anchor and size or either
 * - TODO: ⚠️️ add anchorAndSize
 */
public extension ConstraintKind where Self:View{
   /**
    * One-liner for applyAnchorAndSize
    * Example: view.applyAnchorAndSize(to:self, height:100, align:.center, alignTo:.center)
    * TODO: ⚠️️ Needs the same kind of parameters as anchorAndSize uses
    */
   public func applyAnchorAndSize(to:View, width:CGFloat? = nil, height:CGFloat? = nil, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, multiplier:CGSize = .init(width:1,height:1), offset:CGPoint = .zero, sizeOffset:CGSize = .zero, useMargin:Bool = false) {
      self.applyAnchorAndSize { view in
         let anchor = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset:offset, useMargin:useMargin)
         let size = Constraint.size(self, to:to, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
         return (anchor, size)
      }
   }
   /**
    * One-liner for applyAnchor
    * Example: view.applyAnchor(to:self, align:.center, alignTo:.center)
    */
   public func applyAnchor(to:View, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, offset:CGPoint = .zero, useMargin:Bool = false)  {
      self.applyAnchor { view in
         return Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset:offset, useMargin:useMargin)
      }
   }
   /**
    * One-liner for applySize
    * view.applySize(to:self)//multiplier,offset
    */
   public func applySize(to:View, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)) {
      self.applySize { view in
         return Constraint.size(self, to:to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
}
/**
 * Bulk
 */
extension Array where Element:ConstraintKind.ViewConstraintKind{
   /**
    * Size multiple UIView instance
    * - Parameter offset: Add margin by providing a size offset
    * ## Examples:
    * [btn1,btn2,btn3].applySize(to:self, height:24, offset:.init(width:-40,height:0))
    */
   public func applySizes(to:View, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)){
      self.applySizes { views in
         return views.map{
            Constraint.size($0, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
         }
      }
   }
   /**
    * New
    */
   public func applySizes(width:CGFloat, height:CGFloat, multiplier:CGSize = .init(width:1,height:1)) {
      self.applySizes { views in
         return views.map{
            Constraint.size($0,size:.init(width:width,height:height),multiplier:multiplier)
         }
      }
   }
   /**
    * One-liner for applyAnchor for many views (vertical)
    * Example: view.applyAnchor(to:self, align:.top, alignTo:.top)
    */
   public func applyAnchors(to:View, align:VerticalAlign = .top, alignTo:VerticalAlign = .top, offset:CGFloat = 0, useMargin:Bool = false){
      self.applyAnchors(axis:.ver) { views in
         return views.map{
            Constraint.anchor($0, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         }
      }
   }
   /**
    * One-liner for applyAnchor for many views (horizontal)
    * Example: view.applyAnchor(to:self, align:.left, alignTo:.left)
    */
   public func applyAnchors(to:View, align:HorizontalAlign = .left, alignTo:HorizontalAlign = .left, offset:CGFloat = 0, useMargin:Bool = false){
      self.applyAnchors(axis:.hor) { views in
         return views.map{
            Constraint.anchor($0, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         }
      }
   }
}
