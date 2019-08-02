import Foundation
/**
 * Update arrays of UIViewConstraintKind
 */
extension Array where Element: ConstraintKind.ViewConstraintKind {
   /**
    * Apply constraints on an array of UIViewConstraintKind
    * ## Examples:
    * [label1,label2,label3].applyAnchorsAndSizes { views in
    *     let anchors = [] /*Use Constraint.distribute*/
    *     let sizes = [] /*Use views.map {Constraint.size}*/
    *     return (anchors, sizes)
    * }
    * - Note: Alternativly you can do: views.enumerated().map{Constraint.anchor($0.1, to: self, align: .topLeft, alignTo:.topLeft,offset:CGPoint(x:0,y:48 * $0.0))} etc
    * - Note: If you want to apply only anchors or only sizes then just pass an empty array for either
    */
   public func applyAnchorsAndSizes(closure: AnchorAndSizeClosure) {
      self.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
      let constraints: AnchorConstraintsAndSizeConstraints = closure(self)/*the constraints is returned from the closure*/
      self.enumerated().forEach {
         let anchor: AnchorConstraint = constraints.anchorConstraints[$0.offset]
         let size: SizeConstraint = constraints.sizeConstraints[$0.offset]
         $0.element.setConstraint(anchor: anchor, size: size)
      }
      let layoutConstraints: [NSLayoutConstraint] = {
         let anchors: [NSLayoutConstraint] = constraints.anchorConstraints.reduce([]) { $0 + [$1.x, $1.y] }
         let sizes: [NSLayoutConstraint] = constraints.sizeConstraints.reduce([]) { $0 + [$1.w, $1.h] }
         return anchors + sizes
      }()
      NSLayoutConstraint.activate(layoutConstraints)
   }
   /**
    * Apply sizes
    * - Description: same as applyAnchorsAndSizes but just for sizes
    */
   public func applySizes(closure: SizesClosure) {
      self.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
      let constraints: [SizeConstraint] = closure(self)/*the constraints is returned from the closure*/
      self.enumerated().forEach {
         let size: SizeConstraint = constraints[$0.offset]
         $0.element.size = size
      }
      let layoutConstraints: [NSLayoutConstraint] = constraints.reduce([]) { $0 + [$1.w, $1.h] }
      NSLayoutConstraint.activate(layoutConstraints)
   }
   /**
    * Apply anchors
    * - Description: same as applyAnchorsAndSizes but just for anchors
    */
   public func applyAnchors(closure: AnchorClosure) {
      self.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
      let constraints: [AnchorConstraint] = closure(self)/*the constraints is returned from the closure*/
      self.enumerated().forEach {
         let anchor: AnchorConstraint = constraints[$0.offset]
         $0.element.anchor = anchor
      }
      let layoutConstraints: [NSLayoutConstraint] = constraints.reduce([]) { $0 + [$1.x, $1.y] }
      NSLayoutConstraint.activate(layoutConstraints)
   }

   /**
    * Apply anchors (axis)
    * - Description: same as applyAnchorsAndSizes but just for horizontal or vertical anchor
    */
   public func applyAnchors(axis: Axis, closure: AxisClosure) {
      self.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
      let constraints: [NSLayoutConstraint] = closure(self)/*the constraints is returned from the closure*/
      self.enumerated().forEach {
         let anchor: NSLayoutConstraint = constraints[$0.offset]
         switch axis {
         case .hor: $0.element.anchor?.x = anchor
         case .ver: $0.element.anchor?.y = anchor
         }
      }
      let layoutConstraints: [NSLayoutConstraint] = constraints.reduce([]) { $0 + [$1] }
      NSLayoutConstraint.activate(layoutConstraints)
   }
}
