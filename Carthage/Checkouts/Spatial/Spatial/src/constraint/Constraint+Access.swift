import Foundation
/**
 * Convenient extension methods for UIView (One-liners)
 * Definition: Convenience the state of being able to proceed with something without difficulty
 * - Fixme: ⚠️️ Make these methods for [UIView] as well
 * - Fixme: Rename Constraint+Access to something more meaningful
 */
extension View {
   /**
    * One-liner for activateAnchorAndSize (Align and size a UIView instance)
    * Paramters:
    *    - to: anchor to this view, if sizeTo is not set, then to is used for sizing
    *    - sizeTo: provide this if you need to base the size on another view
    *    - width: provide this if you want to use a fixed width
    *    - height: provide this if you want to use a fixed height
    *    - align: alignment for the `to` view
    *    - alignTo: alignment for the `sizeTo` view, if one was provided
    *    - multiplier: multiplies the `size` or `sizeTo`
    *    - offset: offset for the `to` parameter
    *    - sizeOffset: offset for the `sizeTo` parameter (use negative values for inset)
    *    - useMargin: aligns to autolayout margins or not
    * ## Examples:
    * view.anchorAndSize(to:self,height:100,align:.center,alignTo:.center)//multiplier
    */
   public func anchorAndSize(to: View, sizeTo: View? = nil, width: CGFloat? = nil, height: CGFloat? = nil, align: Alignment = .topLeft, alignTo: Alignment = .topLeft, multiplier: CGSize = .init(width:1, height:1), offset: CGPoint = .zero, sizeOffset: CGSize = .zero, useMargin: Bool = false) {
      self.activateAnchorAndSize { _ in
         let anchor = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         let size: SizeConstraint = {
            if let width = width, let height = height {/*This method exists when you have size, but don't want to set size based on another view*/
               return Constraint.size(self, size: .init(width: width, height: height), multiplier: multiplier)
            } else {
               return Constraint.size(self, to: sizeTo ?? to, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
            }
         }()
         return (anchor, size)
      }
   }
   /**
    * One-liner for anchor (Align a UIView instance)
    * ## Examples:
    * view.anchor(to:self,align:.center,alignTo:.center)
    * - Fixme: ⚠️️ change to -> target (to diff from ver and hor and closure)
    * - Fixme: ⚠️️ make to optional, and use superview
    */
   public func anchor(to: View, align: Alignment = .topLeft, alignTo: Alignment = .topLeft, offset: CGPoint = .zero, useMargin: Bool = false) {
      self.activateAnchor { _ in
         Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
      }
   }
   /**
    * Horizontally align a UIView instance
    * - Fixme: ⚠️️ change to horTo
    */
   public func anchor(horTo: View, align: HorizontalAlign = .left, alignTo: HorizontalAlign = .left, offset: CGFloat = 0, useMargin: Bool = false) {
      self.activateConstraints { view in
         [Constraint.anchor(view, to: horTo, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)]
      }
   }
   /**
    * Vertically align a UIView instance
    *  - Fixme: ⚠️️ change to verTo
    */
   public func anchor(verTo: View, align: VerticalAlign = .top, alignTo: VerticalAlign = .top, offset: CGFloat = 0, useMargin: Bool = false) {
      self.activateConstraints { view in
         [Constraint.anchor(view, to: verTo, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)]
      }
   }
   /**
    * Size a UIView instance
    * ## Examples:
    * view.size(to:self)
    * - Fixme: ⚠️️ Maybe the to could be optional,
    */
   public func size(to: View, width: CGFloat? = nil, height: CGFloat? = nil, offset: CGSize = .zero, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.activateSize { _ in
         Constraint.size(self, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
   /**
    * Size a UIView instance to a speccific metric size
    * - ToDo: ⚠️️ This doesn't have offset, maybe it should 🤔 for now I guess you can always inset the size
    * ## Examples:
    * view.size(width:100,height:100)
    */
   public func size(width: CGFloat, height: CGFloat, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.activateSize { _ in
         Constraint.size(self, size: .init(width: width, height: height), multiplier: multiplier)
      }
   }
   /**
    * One-liner for setting the opposite side of another view
    * - Parameter toAxis: related to this axis
    */
   public func size(to: View, axis: Axis, toAxis: Axis, offset: CGFloat = 0, multiplier: CGFloat = 1) {
      self.activateConstraint { view in
         Constraint.length(view, to: to, viewAxis: axis, toAxis: toAxis, offset: offset, multiplier: multiplier)
      }
   }
   /**
    * Width
    */
   public func size(width: CGFloat, multiplier: CGFloat = 1) {
      self.activateConstraint { view in
         Constraint.width(view, width: width, multiplier: multiplier)
      }
   }
   /**
    * Height
    */
   public func size(height: CGFloat, multiplier: CGFloat = 1) {
      self.activateConstraint { view in
         Constraint.height(view, height: height, multiplier: multiplier)
      }
   }
}
/**
 * One-liner for anchoring multiple views (Bulk)
 */
extension Array where Element: View {
   /**
    * Anchoring for an array of views
    * - Parameter dir: Different between vertical and horizontal
    * Fixme: ⚠️️ Could be named `anchor`
    */
   public func distribute(dir: Axis, align: Alignment = .topLeft, spacing: CGFloat = 0, offset: CGFloat = 0) {
      self.activateAnchors { views in
         switch dir {
         case .hor:
            return Constraint.distribute(horizontally: views, align: .topCenter, spacing: spacing, offset: offset)
         case .ver:
            return Constraint.distribute(vertically: views, align: .topCenter, spacing: spacing, offset: offset)
         }
      }
   }
}
/**
 * One-liner for sizing multiple views (Bulk)
 */
extension Array where Element: View {
   /**
    * Size multiple UIView instance
    * - Parameter offset: Add margin by providing a size offset
    * ## Examples:
    * [btn1,btn2,btn3].size(to:self, height:24, offset:.init(width:-40,height:0))
    */
   public func size(to: View, width: CGFloat? = nil, height: CGFloat? = nil, offset: CGSize = .zero, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.activateSizes { views in
         views.map {
            Constraint.size($0, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
         }
      }
   }
   /**
    * Size multiple UIView instance to a speccific metric size
    * ## Examples:
    * [btn1,btn2,btn3].size(width:96, height:24)
    */
   public func size(width: CGFloat, height: CGFloat, multiplier: CGSize = .init(width: 1, height: 1)) {
      self.activateSizes { views in
         views.map {
            Constraint.size($0, size: .init(width: width, height: height), multiplier: multiplier)
         }
      }
   }
}
