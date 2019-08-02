import Foundation
/**
 * Size constraints
 * - NOTE: Has a lot of NSConstraint and NSAnchor info: https://stackoverflow.com/a/26181982/5389500
 * ## Examples:
 * square.translatesAutoresizingMaskIntoConstraints = false (this enables you to set your own constraints)
 * contentView.layoutMargins = UIEdgeInsetsMake(12,12,12,12)//adds margin to the containing view
 * let pos = Constraint.anchor(square,to:canvas,targetAlign:.topleft,toAlign:.topleft)
 * let size = Constraint.size(square,to:canvas)
 * NSLayoutConstraint.activate([anchor.x,anchor.y,size.w,size.h])
 */
extension Constraint {
   /**
    * Creates a dimensional constraint
    * - Important: Multiplier needs to be 1,1 to not have an effect
    * - Important: Offset needs to be 0,0 to not have an effect
    * ## EXAMPLEs:
    * let sizeConstraint = Constraint.size(square,to:canvas,offset:.zero,multiplier:.init(x:1,y:0.5))
    * let widthConstraint = Constraint.size(square,to:canvas).w
    */
   public static func size(_ view: View, to: View, offset: CGSize = .zero, multiplier: CGPoint = .init(x:1, y:1)) -> SizeConstraint {
      let width = Constraint.width(view, to: to, offset: offset.width, multiplier: multiplier.x)
      let height = Constraint.height(view, to: to, offset: offset.height, multiplier: multiplier.y)
      return (width, height)
   }
   /**
    * Creates a size constraint
    * - Fixme: ⚠️️ This doesn't have offset, maybe it should 🤔 for now I guess you can always inset the size
    * ## Examples:
    * let sizeConstraint = Constraint.size(square,size:CGSize(100,100))
    */
   public static func size(_ view: View, size: CGSize, multiplier: CGSize = .init(width: 1, height: 1)) -> SizeConstraint {
      let width = Constraint.width(view, width: size.width, multiplier: multiplier.width)
      let height = Constraint.height(view, height: size.height, multiplier: multiplier.height)
      return (width, height)
   }
   /**
    * Creates a size constraint
    * - Returns size tuple (based on parent and or width or height)
    *  Parameters:
    *    - view: The view to be sized by AutoLayout
    *    - to: The view to be sized to
    *    - width: custom width, instead of relying on another view to size against
    *    - height: custom height, instead of relying on another view to size against
    *    - offset: add extra offset to view in x,y dir
    *    - multiplier: Scale the size constraint by this scalar (works with other view and custom size)
    * ## Examples:
    * let s = Constraint.size(view, to:parent, height:48)
    */
   public static func size(_ view: View, to: View, width: CGFloat? = nil, height: CGFloat? = nil, offset: CGSize = .zero, multiplier: CGSize = .init(width: 1, height: 1)) -> SizeConstraint {
      let width: NSLayoutConstraint = {
         if let width = width { return Constraint.width(view, width: width, multiplier: multiplier.width) }
         else { return Constraint.width(view, to: to, offset: offset.width, multiplier: multiplier.width) }
      }()
      let height: NSLayoutConstraint = {
         if let height = height { return Constraint.height(view, height: height, multiplier: multiplier.height) }
         else { return Constraint.height(view, to: to, offset: offset.height, multiplier: multiplier.height) }
      }()
      return (width, height)
   }
   /**
    * Creates a width constraint (based on a CGFloat width)
    * - Note: When AutoLayout doesn't relate to a view the multiplier doesn't take effect, so we apply the multiplier directly to the constant
    */
   public static func width(_ view: View, width: CGFloat, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      return .init(item: view, attribute: .width, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width * multiplier)//NSLayoutAttribute
   }
   /**
    * Creates a height constraint (based on a CGFloat height)
    * - Note: When AutoLayout doesnt relate to a view the multiplier doesnt take effect, so we apply the multiplier directly to the constant
    */
   public static func height(_ view: View, height: CGFloat, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      return .init(item: view, attribute: .height, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height * multiplier)//NSLayoutAttribute
   }
   /**
    * Creates a width constraint (based on another views width constraint)
    */
   public static func width(_ view: View, to: View, offset: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      return .init(item: view, attribute: .width, relatedBy: relation, toItem: to, attribute: .width, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
   }
   /**
    * Creates a height constraint (based on another views width constraint)
    */
   public static func height(_ view: View, to: View, offset: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      return .init(item: view, attribute: .height, relatedBy: relation, toItem: to, attribute: .height, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
   }
   /**
    * Represents a side, basically you can base one axis-length on another, so vertical length represents horixontal length etc
    * - Note: Useful if you want to set a width of an object to the height of another object
    * - Note: You can also use it on it's own view to copy width to height for instance
    * - Parameters:
    *    - to: The view you relate to (usually the parent)
    *    - view: the view to apply the constraint to
    *    - viewAxis: the attribute to set to
    *    - toAxis: the attribute to derive from
    *    - offset: x or y
    *    - multiplier: scalar value, default is 1
    * - Fixme: ⚠️️ Consider renaming this to side or axisLength?
    * - Fixme: ⚠️️ Consider making the distinction between between viewAxis and toAxis more clear
    * ## Examples:
    * let widthConstraint = Constraint.length(square,viewAxis:.horizontal,axis:.vertical)
    */
   public static func length(_ view: View, to: View, viewAxis: Axis, toAxis: Axis, offset: CGFloat = 0, multiplier: CGFloat = 1, relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
      let viewAttr: NSLayoutConstraint.Attribute = viewAxis == .hor ? .width : .height
      let toAttr: NSLayoutConstraint.Attribute = toAxis == .hor ? .width : .height
      return .init(item: view, attribute: viewAttr, relatedBy: relation, toItem: to, attribute: toAttr, multiplier: multiplier, constant: offset)
   }
}
