
import Foundation
/**
 * Update constraints (For items that are of type ConstraintKind)
 * - Note: adding a method called activateConstraints doesn't make any sense because you have only anchor and size or either
 * - Todo: ⚠️️ add anchorAndSize
 */
extension ConstraintKind where Self:View{
   /**
    * One-liner for applyAnchorAndSize
    * ## Examples:
    * view.applyAnchorAndSize(to:self, height:100, align:.center, alignTo:.center)
    * - TODO: ⚠️️ Needs the same kind of parameters as anchorAndSize uses
    * - Parameter to: The instance to apply to
    * - Parameter width: the width to apply to instance
    * - Parameter height: the height to apply to instance
    * - Parameter align: alignment for the `to` view
    * - Parameter alignTo: alignment for the `sizeTo` view, if one was provided
    * - Parameter multiplier: multiplies the `size` or `sizeTo`
    * - Parameter offset: offset for the `to` parameter
    * - Parameter sizeOffset: offset for the `sizeTo` parameter (use negative values for inset)
    * - Parameter useMargin: aligns to autolayout margins or not
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
    * ## Examples:
    * view.applyAnchor(to:self, align:.center, alignTo:.center)
    * - Parameter to: The instance to apply to
    * - Parameter align: alignment for the `to` view
    * - Parameter alignTo: alignment for the `sizeTo` view, if one was provided
    * - Parameter offset: offset for the `to` parameter
    * - Parameter useMargin: aligns to autolayout margins or not
    */
   public func applyAnchor(to:View, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, offset:CGPoint = .zero, useMargin:Bool = false)  {
      self.applyAnchor { view in
         return Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset:offset, useMargin:useMargin)
      }
   }
   /**
    * One-liner for applySize
    * ## Examples:
    * view.applySize(to:self)//multiplier,offset
    * - Parameter to: The instance to apply to
    * - Parameter width: the width to apply to instance
    * - Parameter height: the height to apply to instance
    * - Parameter multiplier: multiplies the `size` or `sizeTo`
    * - Parameter offset: offset for the `to` parameter
    */
   public func applySize(to:View, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)) {
      self.applySize { view in
         return Constraint.size(self, to:to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
}
