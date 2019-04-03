import Foundation
/**
 * Array
 */
extension Array where Element:View{
   /**
    * AutoLayout Sugar for UIView's (Multiple)
    * ## Examples:
    * [label1,label2,label3].activateConstraint { views in
    *      let anchors = Constraint.distribute(vertically: views, align: .topLeft)
    *      let sizes = views.map{Constraint.size(width:96,height:42)}
    *      return (anchors, sizes)
    * }
    * - NOTE: ⚠️️ You have to zip together anchors in some cases
    * - ToDo: ⚠️️ Can we utilize activateAnchors and activateSizes in this method? 🤔
    */
   public func activateAnchorsAndSizes(closure:ConstraintsClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:[NSLayoutConstraint] = {
         let constraints:AnchorConstraintsAndSizeConstraints = closure(self)
         let anchors = constraints.anchorConstraints.reduce([]) { $0 + [$1.x,$1.y] }
         let sizes = constraints.sizeConstraints.reduce([]) { $0 + [$1.w,$1.h] }
         return anchors + sizes
      }()
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activates multiple anchor constraints
    * ## Examples:
    * [label1,label2,label3].activateAnchors {
    *    return Constraint.distribute(vertically: views, align: .topCenter)
    * }
    */
   public func activateAnchors(closure:AnchorConstraintsClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:[NSLayoutConstraint] = {
         let constraints:[AnchorConstraint] = closure(self)
         let anchors = constraints.reduce([]) { $0 + [$1.x,$1.y] }
         return anchors
      }()
      NSLayoutConstraint.activate(constraints)
   }
   /**
    * Activates multiple size constraints
    * ## Examples:
    * [btn1,btn2,btn3].activateSizes { views in
    *    return views.map{$0.size(width:96,height:42)}
    * }
    */
   public func activateSizes(closure:SizeConstraintsClosure) {
      self.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
      let constraints:[NSLayoutConstraint] = {
         let constraints:[SizeConstraint] = closure(self)
         let sizes = constraints.reduce([]) { $0 + [$1.w,$1.h] }
         return sizes
      }()
      NSLayoutConstraint.activate(constraints)
   }
}
