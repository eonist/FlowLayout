import Foundation
/**
 * Convenient extension methods for UIView (One-liners)
 * Definition: Convenience the state of being able to proceed with something without difficulty
 * - TODO: ⚠️️ Make these methods for [UIView] as well
 * - TODO: Rename Constraint+Access to something more meaningful
 */
extension View {
   /**
    * One-liner for activateAnchorAndSize (Align and size a UIView instance)
    * - Parameter to: anchor to this view, if sizeTo is not set, then to is used for sizing
    * - Parameter sizeTo: provide this if you need to base the size on another view
    * - Parameter width: provide this if you want to use a fixed width
    * - Parameter height: provide this if you want to use a fixed height
    * - Parameter align: alignment for the `to` view
    * - Parameter alignTo: alignment for the `sizeTo` view, if one was provided
    * - Parameter multiplier: multiplies the `size` or `sizeTo`
    * - Parameter offset: offset for the `to` parameter
    * - Parameter sizeOffset: offset for the `sizeTo` parameter (use negative values for inset)
    * - Parameter useMargin: aligns to autolayout margins or not
    * ## Examples:
    * view.anchorAndSize(to:self,height:100,align:.center,alignTo:.center)//multiplier
    */
   public func anchorAndSize(to:View, sizeTo:View? = nil, width:CGFloat? = nil, height:CGFloat? = nil, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, multiplier:CGSize = .init(width:1,height:1), offset:CGPoint = .zero, sizeOffset:CGSize = .zero, useMargin:Bool = false){
      self.activateAnchorAndSize { view in
         let a = Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
         let s:SizeConstraint = {
            if let width = width, let height = height {/*This method exists when you have size, but don't want to set size based on another view*/
               return Constraint.size(self, size: CGSize(width:width,height:height), multiplier: multiplier)
            }else {
               return Constraint.size(self, to: sizeTo ?? to, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
            }
         }()
         return (a,s)
      }
   }
   /**
    * One-liner for anchor (Align a UIView instance)
    * ## Examples:
    * view.anchor(to:self,align:.center,alignTo:.center)
    * - TODO: ⚠️️ change to -> target (to diff from ver and hor and closure)
    * - TODO: ⚠️️ make to optional, and use superview
    */
   public func anchor(to:View, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, offset:CGPoint = .zero, useMargin:Bool = false){
      self.activateAnchor{ view in
         return Constraint.anchor(self, to: to, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)
      }
   }
   /**
    * Horizontally align a UIView instance
    * - TODO: ⚠️️ change to horTo
    */
   public func anchor(horTo:View, align:HorizontalAlign = .left, alignTo:HorizontalAlign = .left, offset:CGFloat = 0, useMargin:Bool = false) {
      self.activateConstraints { view in
         return [Constraint.anchor(view, to: horTo, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)]
      }
   }
   /**
    * Vertically align a UIView instance
    *  - TODO: ⚠️️ change to verTo
    */
   public func anchor(verTo:View, align:VerticalAlign = .top, alignTo:VerticalAlign = .top, offset:CGFloat = 0, useMargin:Bool = false) {
      self.activateConstraints { view in
         return [Constraint.anchor(view, to: verTo, align: align, alignTo: alignTo, offset: offset, useMargin: useMargin)]
      }
   }
   /**
    * Size a UIView instance
    * ## Examples:
    * view.size(to:self)
    * - ToDo: ⚠️️ Maybe the to could be optional, 
    */
   public func size(to:View, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)){
      self.activateSize { view in
         return Constraint.size(self, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
      }
   }
   /**
    * Size a UIView instance to a speccific metric size
    * - ToDo: ⚠️️ This doesn't have offset, maybe it should 🤔 for now I guess you can always inset the size
    * ## Examples:
    * view.size(width:100,height:100)
    */
   public func size(width:CGFloat, height:CGFloat, multiplier:CGSize = .init(width:1,height:1)) {
      self.activateSize { view in
         return Constraint.size(self, size:.init(width:width,height:height), multiplier:multiplier)
      }
   }
   /**
    * One-liner for setting the opposite side of another view
    * - Parameter toAxis: related to this axis
    */
   public func size(to:View, axis:Axis,toAxis:Axis, offset:CGFloat = 0, multiplier:CGFloat = 1){
      self.activateConstraint { view in
         return Constraint.length(view, to:to, viewAxis:axis, toAxis:toAxis, offset:offset, multiplier:multiplier)
      }
   }
   /**
    * Width
    */
   public func size(width:CGFloat, multiplier:CGFloat = 1){
      self.activateConstraint { view in
         return Constraint.width(view, width: width, multiplier: multiplier)
      }
   }
   /**
    * Height
    */
   public func size(height:CGFloat, multiplier:CGFloat = 1){
      self.activateConstraint { view in
         return Constraint.height(view, height: height, multiplier: multiplier)
      }
   }
}
/**
 * One-liner for anchoring multiple views (Bulk)
 */
extension Array where Element:View{
   /**
    * Anchoring for an array of views
    * - Parameter dir: Different between vertical and horizontal
    * TODO: ⚠️️ Could be named `anchor`
    */
   public func distribute(dir:Axis, align:Alignment = .topLeft, spacing:CGFloat = 0, offset:CGFloat = 0){
      self.activateAnchors { views in
         switch dir {
         case .hor:
            return Constraint.distribute(horizontally: views, align: .topCenter, spacing:spacing, offset:offset)
         case .ver:
            return Constraint.distribute(vertically: views, align: .topCenter, spacing:spacing, offset:offset)
         }
      }
   }
}
/**
 * One-liner for sizing multiple views (Bulk)
 */
extension Array where Element:View{
   /**
    * Size multiple UIView instance
    * - Parameter offset: Add margin by providing a size offset
    * ## Examples:
    * [btn1,btn2,btn3].size(to:self, height:24, offset:.init(width:-40,height:0))
    */
   public func size(to:View, width:CGFloat? = nil, height:CGFloat? = nil, offset:CGSize = .zero, multiplier:CGSize = .init(width:1,height:1)){
      self.activateSizes { views in
         return views.map{
            return Constraint.size($0, to: to, width: width, height: height, offset: offset, multiplier: multiplier)
         }
      }
   }
   /**
    * Size multiple UIView instance to a speccific metric size
    * ## Examples:
    * [btn1,btn2,btn3].size(width:96, height:24)
    */
   public func size(width:CGFloat, height:CGFloat, multiplier:CGSize = .init(width:1,height:1)) {
      self.activateSizes { views in
         return views.map{
            return Constraint.size($0,size:.init(width:width,height:height),multiplier:multiplier)
         }
      }
   }
}
/**
 * One-liner for sizing and anchoring multiple views (Bulk)
 */
extension Array where Element:View {
   /**
    * One-liner for activateAnchorsAndSizes (Align and size multiple UIView instance)
    * - Important: ⚠️️ This method is a bit beta (WIP)
    * - Important: ⚠️️ This method can only use it's parent as a size reference, not a different view, maybe in the future we can enable more options
    * - TODO: ⚠️️ The align part isn't used, try to add it to the code somehow
    * ## Examples: 🤷
    * distributeAndSize(dir:.hor, height:42)
    */
   public func distributeAndSize(dir:Axis, width:CGFloat? = nil, height:CGFloat? = nil, align:Alignment = .topLeft, alignTo:Alignment = .topLeft, spacing:CGFloat = 0, multiplier:CGSize = .init(width:1,height:1), offset:CGFloat = 0, sizeOffset:CGSize = .zero){
      self.activateAnchorsAndSizes { views in
         let anchors:[AnchorConstraint] = {
            // TODO: ⚠️️ this part is a duplicate of the single version of this method, so reuse it somehow
            switch dir {
            case .hor:
               return Constraint.distribute(horizontally: views, align: alignTo, spacing:spacing, offset:offset)
            case .ver:
               return Constraint.distribute(vertically: views, align: alignTo, spacing:spacing, offset:offset)
            }
         }()
         let sizes:[SizeConstraint] = views.map { view in
            // TODO: ⚠️️ this part is a duplicate of the single version of this method, so reuse it somehow
            let s:SizeConstraint = {
               if let width = width, let height = height {/*This method exists when you have size, but don't want to set size based on another view*/
                  return Constraint.size(view, size: .init(width:width,height:height), multiplier: multiplier)
               }else {
                  guard let superView = view.superview else {fatalError("View must have superview")}
                  return Constraint.size(view, to: superView, width: width, height: height, offset: sizeOffset, multiplier: multiplier)
               }
            }()
            return s
         }
         return (anchors, sizes)
      }
   }
}
