import Foundation
/**
 * One-liner for sizing and anchoring multiple views (Bulk)
 */
extension Array where Element: View {
   /**
    * One-liner for activateAnchorsAndSizes (Align and size multiple UIView instance)
    * - Important: ⚠️️ This method is a bit beta (WIP)
    * - Important: ⚠️️ This method can only use it's parent as a size reference, not a different view, maybe in the future we can enable more options
    * - Remark: this method works with regular NSViews
    * - Fixme: ⚠️️ The align part isn't used, try to add it to the code somehow
    * ## Examples: 🤷
    * let views: [NSView] = [NSColor.blue, .green, .red].map { color in with (.init()) { $0.wantsLayer = true; $0.layer?.backgroundColor = color.cgColor; self.documentView?.addSubview($0) }
    * views.distributeAndSize(dir:.hor, height:42)
    */
   public func distributeAndSize(dir: Axis, width: CGFloat? = nil, height: CGFloat? = nil, align: Alignment = .topLeft, alignTo: Alignment = .topLeft, spacing: CGFloat = 0, multiplier: CGSize = .init(width: 1, height: 1), offset: CGFloat = 0, sizeOffset: CGSize = .zero) {
      self.activateAnchorsAndSizes { views in
         let anchors: [AnchorConstraint] = {
            // Fixme: ⚠️️ this part is a duplicate of the single version of this method, so reuse it somehow
            switch dir {
            case .hor: return Constraint.distribute(horizontally: views, align: alignTo, spacing: spacing, offset: offset)
            case .ver: return Constraint.distribute(vertically: views, align: alignTo, spacing: spacing, offset: offset)
            }
         }()
         let sizes: [SizeConstraint] = views.map { view in
            // Fixme: ⚠️️ this part is a duplicate of the single version of this method, so reuse it somehow
            let size: SizeConstraint = {
               if let width = width, let height = height {/*This method exists when you have size, but don't want to set size based on another view*/
                  return Constraint.size(view, size: .init(width: width, height: height), multiplier: multiplier)
               } else {
                  guard let superView: View = view.superview else { fatalError("View must have superview") }
                  return Constraint.size(view, to: superView, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
               }
            }()
            return size
         }
         return (anchors, sizes)
      }
   }
}
