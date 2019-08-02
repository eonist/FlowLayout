import Foundation

/**
 * Bulk
 */
extension Array where Element: ConstraintKind.ViewConstraintKind {
   /**
    * Size multiple UIView instance
    * - Parameter offset: Add margin by providing a size offset
    * ## Examples:
    * [btn1,btn2,btn3].applySize(to:self, height:24, offset:.init(width:-40,height:0))
    */
   public func applySizes(to: View, width: CGFloat? = nil, height: CGFloat? = nil, offset: CGSize = .zero, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.applySizes { views in
         views.map {
            Constraint.size($0, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
         }
      }
   }
   /**
    * - Description: Same as regular applySizes but we must provide both width and height
    */
   public func applySizes(width: CGFloat, height: CGFloat, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.applySizes { views in
         views.map {
            Constraint.size($0, size: .init(width: width, height: height), multiplier: multiplier)
         }
      }
   }
   /**
    * One-liner for applyAnchor for many views (vertical)
    * ## Examples:
    * view.applyAnchor(to:self, align:.top, alignTo:.top)
    */
   public func applyAnchors(to: View, align: VerticalAlign = .top, alignTo: VerticalAlign = .top, offset: CGFloat = 0, useMargin: Bool = false) {
      self.applyAnchors(axis: .ver) { views in
         views.map {
            Constraint.anchor($0, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         }
      }
   }
   /**
    * One-liner for applyAnchor for many views (horizontal)
    * ## Examples:
    * view.applyAnchor(to:self, align:.left, alignTo:.left)
    */
   public func applyAnchors(to: View, align: HorizontalAlign = .left, alignTo: HorizontalAlign = .left, offset: CGFloat = 0, useMargin: Bool = false) {
      self.applyAnchors(axis: .hor) { views in
         views.map {
            Constraint.anchor($0, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         }
      }
   }
}
