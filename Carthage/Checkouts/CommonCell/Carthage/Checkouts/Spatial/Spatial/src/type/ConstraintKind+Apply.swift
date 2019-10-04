import Foundation
/**
 * Update constraints (For items that are of type ConstraintKind)
 * - NOTE: adding a method called activateConstraints doesn't make any sense because you have only anchor and size or either
 */
extension ConstraintKind where Self: View {
   /**
    * Activates and sets size and anchor to a ConstraintKind
    * - Note Same as UIView().activateConstraint... but also sets size and anchor constraints (ConstraintKind) (For animation etc)
    * - Important: remeber to deactive constraints before calling this method
    * ## Examples:
    * sliderBar.applyAnchorAndSize { view in
    *      let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
    *      let size = Constraint.size(view, size: size)
    *      return (anchor:anchor, size:size) // (anchor, size) 👈 also works
    * }
    */
   public func applyAnchorAndSize(closure: AnchorAndSizeClosure) {
      self.translatesAutoresizingMaskIntoConstraints = false
      let constraints: AnchorAndSize = closure(self) // the constraints is returned from the closure
      setConstraint(anchor: constraints.anchor, size: constraints.size)
      NSLayoutConstraint.activate([constraints.anchor.x, constraints.anchor.y, constraints.size.w, constraints.size.h])
   }
   /**
    * Activates and sets anchor to a ConstraintKind
    * - Important: remeber to deactive constraints before calling this method
    */
   public func applyAnchor(closure: AnchorClosure) {
      self.translatesAutoresizingMaskIntoConstraints = false
      let anchorConstraint: AnchorConstraint = closure(self) // the constraints is returned from the closure
      let constraints: [NSLayoutConstraint] = [anchorConstraint.x, anchorConstraint.y]
      self.anchor = anchorConstraint
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activates and sets size to a ConstraintKind
    * - Important: remeber to deactive constraints before calling this method
    */
   public func applySize(closure: SizeClosure) {
      self.translatesAutoresizingMaskIntoConstraints = false
      let sizeConstraint: SizeConstraint = closure(self) // the constraints is returned from the closure
      let constraints: [NSLayoutConstraint] = [sizeConstraint.w, sizeConstraint.h]
      self.size = sizeConstraint
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Sets both anchor and size to a ConstraintKind
    * - Note: this could be a variable, but I guess it's not because for some reason? 🤔
    */
   public func setConstraint(anchor: AnchorConstraint, size: SizeConstraint) {
      self.anchor = anchor
      self.size = size
   }
}
