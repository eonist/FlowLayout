import Foundation
/*Single*/
public typealias AnchorConstraint = (x: NSLayoutConstraint, y: NSLayoutConstraint)
public typealias SizeConstraint = (w: NSLayoutConstraint, h: NSLayoutConstraint)
/*Bulk*/
public typealias AnchorConstraintsAndSizeConstraints = (anchorConstraints: [AnchorConstraint], sizeConstraints: [SizeConstraint])
/**
 * Single
 */
extension View {
   /*We keep AnchorsAndSizes in a tuple, because applyConstraints wouldn't work with just an array*/
   public typealias AnchorsAndSizes = (anchors: [NSLayoutConstraint], sizes: [NSLayoutConstraint])//can this go to [UIView].AnchorsAndSizes  ?
   public typealias ConstraintsClosure = (_ view: View) -> [NSLayoutConstraint]
   public typealias ConstraintClosure = (_ view: View) -> NSLayoutConstraint
   /*Tuple*/
   public typealias AnchorAndSize = (anchor: AnchorConstraint, size: SizeConstraint)
   public typealias AnchorAndSizeClosure = (_ view: View) -> AnchorAndSize
   /*Single*/
   public typealias AnchorClosure = (_ view: View) -> AnchorConstraint
   public typealias SizeClosure = (_ view: View) -> SizeConstraint
}
/**
 * Bulk
 */
extension Array where Element: View {
   public typealias ConstraintsClosure = (_ views: [View]) -> AnchorConstraintsAndSizeConstraints
   public typealias AnchorConstraintsClosure = (_ views: [View]) -> [AnchorConstraint]
   public typealias SizeConstraintsClosure = (_ views: [View]) -> [SizeConstraint]
}
