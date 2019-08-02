import Foundation
/**
 * Offset horizontally or vertically
 */
extension ConstraintKind where Self: View {
   /**
    * - Remark: Callback closures signatures as typalias makes code easier to read
    */
   typealias UpdateAnchorClosure = (_ superView: View, _ oldAnchor: AnchorConstraint) -> Void
   typealias UpdateSizeClosure = (_ superView: View, _ oldAnchor: SizeConstraint) -> Void
   /**
    * Updates horizontal anchor
    * - Parameters:
    *    - offset: The x you want to apply
    *    - align: horizontal axis alignment type for the instance you are applying to
    *    - alignTo: horizontal axis alignment to another instance
    */
   public func update(offset: CGFloat, align: HorizontalAlign, alignTo: HorizontalAlign) {
      updateAnchor { superview, oldAnchor in
         NSLayoutConstraint.deactivate([oldAnchor.x])
         let newAnchorX = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
         NSLayoutConstraint.activate([newAnchorX])
         self.anchor?.x = newAnchorX
      }
   }
   /**
    * Updates vertical anchor
    * - Parameters:
    *    - offset: The y you want to apply
    *    - align: vertical axis alignment type for the instance you are applying to
    *    - alignTo: vertical axis alignment to another instance
    */
   public func update(offset: CGFloat, align: VerticalAlign, alignTo: VerticalAlign) {
      updateAnchor { superview, oldAnchor in
         NSLayoutConstraint.deactivate([oldAnchor.y])
         let newAnchorY = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
         NSLayoutConstraint.activate([newAnchorY])
         self.anchor?.y = newAnchorY
      }
   }
   /**
    * Update (horizontal & vertical)
    * - Parameters:
    *    - offset: The x & y you want to apply
    *    - align: axis alignment type for the instance you are applying to
    *    - alignTo: axis alignment to another instance
    */
   public func update(offset: CGPoint, align: Alignment, alignTo: Alignment) {
      updateAnchor { superview, oldAnchor in
         NSLayoutConstraint.deactivate([oldAnchor.x, oldAnchor.y])
         let newAnchor: AnchorConstraint = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: offset)
         NSLayoutConstraint.activate([newAnchor.x, newAnchor.y])
         self.anchor = newAnchor
      }
   }
   /**
    * Update (size)
    * - Parameter size: the size you want to resize the instance to
    */
   public func update(size: CGSize) {
      updateSize { _, oldSize in
         NSLayoutConstraint.deactivate([oldSize.w, oldSize.h])
         let newSize: SizeConstraint = Constraint.size(self, size: size)
         NSLayoutConstraint.activate([newSize.w, newSize.h])
         self.size = newSize
      }
   }
   /**
    * Update (size & position) offset
    * - Parameter multiplier: only applies to the size (⚠️️ NOT IMPLEMENTED YET ⚠️️)
    */
   public func update(rect: CGRect, align: Alignment, alignTo: Alignment) {
      guard let superview: View = self.superview else { Swift.print("⚠️️ err superview not available ⚠️️"); return }
      guard let oldAnchor: AnchorConstraint = self.anchor else { Swift.print("⚠️️ err anchor not available ⚠️️"); return }
      guard let oldSize: SizeConstraint = self.size else { Swift.print("⚠️️ err size not available ⚠️️"); return }
      NSLayoutConstraint.deactivate([oldAnchor.y, oldAnchor.x, oldSize.w, oldSize.h])
      let newAnchor: AnchorConstraint = Constraint.anchor(self, to: superview, align: align, alignTo: alignTo, offset: rect.origin)
      let newSize: SizeConstraint = Constraint.size(self, size: rect.size)
      NSLayoutConstraint.activate([newAnchor.x, newAnchor.y, newSize.w, newSize.h])
      self.anchor = newAnchor
      self.size = newSize
      #if os(iOS)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
      #elseif os(macOS)
      superview.updateConstraintsForSubtreeIfNeeded()
      #endif
   }
}
/**
 * Internal
 */
extension ConstraintKind where Self: View {
   /**
    * Internal (Anchor)
    * - Note: used in conjunction with animation
    */
   fileprivate func updateAnchor(_ closure: UpdateAnchorClosure) {
      guard let superview: View = self.superview else { Swift.print("⚠️️ err superview not available ⚠️️"); return }
      guard let oldAnchor: AnchorConstraint = self.anchor else { Swift.print("⚠️️ err anchor not available ⚠️️"); return }
      closure(superview, oldAnchor)
      #if os(iOS)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
      #elseif os(macOS)
      superview.updateConstraintsForSubtreeIfNeeded()
      #endif
   }
   /**
    * Internal (Size)
    * - Note: used in conjunction with animation
    */
   fileprivate func updateSize(_ closure: UpdateSizeClosure) {
      guard let superview: View = self.superview else { Swift.print("⚠️️ err superview not available ⚠️️"); return }
      guard let oldSize: SizeConstraint = self.size else { Swift.print("⚠️️ err sice not available ⚠️️"); return }
      closure(superview, oldSize)
      #if os(iOS)
      superview.layoutIfNeeded()/*The superview is responsible for updating subView constraint updates*/
      #elseif os(macOS)
      superview.updateConstraintsForSubtreeIfNeeded()
      #endif
   }
}
