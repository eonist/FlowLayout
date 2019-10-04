import Foundation
/**
 * - Note: Convenient UIView so you don't have to add anchor and size your self
 */
open class ConstraintView: View, ConstraintKind {
   public var anchor: AnchorConstraint?
   public var size: SizeConstraint?
}
