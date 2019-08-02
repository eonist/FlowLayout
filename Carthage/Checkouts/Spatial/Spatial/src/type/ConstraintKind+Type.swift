import Foundation
/**
 * Single
 */
extension ConstraintKind where Self: View {
   /**
    * Combinational types and closure signatures
    * - Note: This could be useful in a global domain, for now just access it by: ConstraintKind.UIViewConstraintKind
    */
   public typealias ViewConstraintKind = View & ConstraintKind
   public typealias AnchorAndSize = (anchor: AnchorConstraint, size: SizeConstraint)
}
/**
 * Bulk
 */
extension Array where Element: ConstraintKind.ViewConstraintKind {
   public typealias AnchorAndSizeClosure = (_ views: [View]) -> AnchorConstraintsAndSizeConstraints
   public typealias SizesClosure = (_ views: [View]) -> [SizeConstraint]
   public typealias AnchorClosure = (_ views: [View]) -> [AnchorConstraint]
   public typealias AxisClosure = (_ views: [View]) -> [NSLayoutConstraint]
}
