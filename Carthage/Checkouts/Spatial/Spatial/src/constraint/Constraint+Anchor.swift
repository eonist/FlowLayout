import Foundation
/**
 * Positional constraints (Aligning relative to another view (x,y))
 * - Remark: Snapkit and Carthography are too clever and caters to too many facets of autolayout. This library is just a simple extension that does basic autolayout while reducing the setup time in half.
 * - ToDo: ⚠️️ Not really an anchor, consider renaming to ConstraintAttribute or pin, point, origin, position? or?
 * - Note: anchor is a more appropriate name than, pin,pos,pt,edge,put,magnet,align,corner (anchor can represent both corner,edge and center)
 */
public class Constraint {
   /**
    * Creates a positional constraint
    * - Parameter useMargin: This works, but when you use size constraints then you have to pin to sides, or use the sizeOffset
    * ## Examples:
    * activateAnchorAndSize { view in
    *    let a = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
    *    let s = Constraint.size(self, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
    *    return (a,s)
    * }
    */
   public static func anchor(_ view: View, to: View, align: Alignment, alignTo: Alignment, offset: CGPoint = .zero, useMargin: Bool = false) -> AnchorConstraint {
      let hor: NSLayoutConstraint = Constraint.anchor(view, to: to, align: align.horAlign, alignTo: alignTo.horAlign, offset: offset.x, useMargin: useMargin)
      let ver: NSLayoutConstraint = Constraint.anchor(view, to: to, align: align.verAlign, alignTo: alignTo.verAlign, offset: offset.y, useMargin: useMargin)
      return (hor, ver)
   }
   /**
    * Horizontal anchoring
    */
    public static func anchor(_ view: View, to: View, align: HorizontalAlign, alignTo: HorizontalAlign, offset: CGFloat = 0, useMargin: Bool = false, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      return .init(item: view, attribute: Util.layoutAttr(align: align), relatedBy: relation, toItem: to, attribute: Util.layoutAttr(align: alignTo, useMargin: useMargin), multiplier: 1.0, constant: offset)
   }
   /**
    * Vertical anchoring
    */
   public static func anchor(_ view: View, to: View, align: VerticalAlign, alignTo: VerticalAlign, offset: CGFloat = 0, useMargin: Bool = false, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      let attr: NSLayoutConstraint.Attribute = Util.layoutAttr(align: align)
      let relatedByAttr: NSLayoutConstraint.Attribute = Util.layoutAttr(align: alignTo, useMargin: useMargin)
      return .init(item:view, attribute:attr, relatedBy: relation, toItem: to, attribute: relatedByAttr, multiplier: 1.0, constant: offset)
   }
}
/**
 * Internal helper methods
 */
fileprivate class Util {
   /**
    * For aligning in the x axis (internal)
    * - Note: Layout margin is o ly available for ios and tvos
    */
   static func layoutAttr(align: HorizontalAlign, useMargin: Bool = false) -> NSLayoutConstraint.Attribute {
      switch align {
      case .left:
         #if os(iOS)
         if useMargin { return NSLayoutConstraint.Attribute.leftMargin }
         #endif
         return NSLayoutConstraint.Attribute.left
      case .right:
         #if os(iOS)
         if useMargin { return NSLayoutConstraint.Attribute.rightMargin }
         #endif
         return NSLayoutConstraint.Attribute.right
      case .centerX:
         #if os(iOS)
         if useMargin { return NSLayoutConstraint.Attribute.centerXWithinMargins }
         #endif
         return NSLayoutConstraint.Attribute.centerX
      }
   }
   /**
    * For aligning in the y axis (internal)
    * - Note: Layout margin is o ly available for ios and tvos
    */
   static func layoutAttr(align: VerticalAlign, useMargin: Bool = false) -> NSLayoutConstraint.Attribute {
      switch align {
      case .top:
         #if os(iOS)
         if useMargin { return NSLayoutConstraint.Attribute.topMargin }
         #endif
         return NSLayoutConstraint.Attribute.top
      case .bottom:
          #if os(iOS)
          if useMargin { return NSLayoutConstraint.Attribute.bottomMargin }
          #endif
         return NSLayoutConstraint.Attribute.bottom
      case .centerY:
         #if os(iOS)
         if useMargin { return NSLayoutConstraint.Attribute.centerYWithinMargins }
         #endif
         return NSLayoutConstraint.Attribute.centerY
      }
   }
}
