import Foundation
/**
 * Update constraints (For items that are of type ConstraintKind)
 * - Note: adding a method called activateConstraints doesn't make any sense because you have only anchor and size or either
 * - Fixme: ⚠️️ add anchorAndSize
 */
extension ConstraintKind where Self: View {
   /**
    * One-liner for applyAnchorAndSize
    * ## Examples:
    * view.applyAnchorAndSize(to:self, height:100, align:.center, alignTo:.center)
    * - Fixme: ⚠️️ Needs the same kind of parameters as anchorAndSize uses
    * - Parameters:
    *    - to: The instance to apply to
    *    - width: the width to apply to instance
    *    - height: the height to apply to instance
    *    - align: alignment for the `to` view
    *    - alignTo: alignment for the `sizeTo` view, if one was provided
    *    - multiplier: multiplies the `size` or `sizeTo`
    *    - offset: offset for the `to` parameter
    *    - sizeOffset: offset for the `sizeTo` parameter (use negative values for inset)
    *    - useMargin: aligns to autolayout margins or not
    */
   public func applyAnchorAndSize(to: View, width: CGFloat? = nil, height: CGFloat? = nil, align: Alignment = .topLeft, alignTo: Alignment = .topLeft, multiplier: CGSize = .init(width: 1, height: 1), offset: CGPoint = .zero, sizeOffset: CGSize = .zero, useMargin: Bool = false) {
      self.applyAnchorAndSize { _ in
         let anchor: AnchorConstraint = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         let size: SizeConstraint = Constraint.size(self, to: to, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
         return (anchor, size)
      }
   }
   /**
    * One-liner for applyAnchor
    * ## Examples:
    * view.applyAnchor(to:self, align:.center, alignTo:.center)
    * - Parameters:
    *    - to: The instance to apply to
    *    - align: alignment for the `to` view
    *    - alignTo: alignment for the `sizeTo` view, if one was provided
    *    - offset: offset for the `to` parameter
    *    - useMargin: aligns to autolayout margins or not
    */
   public func applyAnchor(to: View, align: Alignment = .topLeft, alignTo: Alignment = .topLeft, offset: CGPoint = .zero, useMargin: Bool = false) {
      self.applyAnchor { _ in
         Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
      }
   }
   /**
    * One-liner for applySize
    * ## Examples:
    * view.applySize(to:self)//multiplier,offset
    * Parameters:
    *    - to: The instance to apply to
    *    - width: the width to apply to instance
    *    - height: the height to apply to instance
    *    - multiplier: multiplies the `size` or `sizeTo` default is (width:1,height:1)
    *    - offset: offset for the `to` parameter
    */
   public func applySize(to: View, width: CGFloat? = nil, height: CGFloat? = nil, offset: CGSize = .zero, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.applySize { _ in
         Constraint.size(self, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
}
