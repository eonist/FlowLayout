import UIKit
import With
import Spatial
/**
 * Create
 */
extension ImageCell{
   /**
    * Creates ImgView
    */
   func createImgView() -> UIImageView {
      return with(.init()){/*Create the image view*/
         $0.contentMode = .scaleAspectFill/*Fills the view*/
         $0.backgroundColor = .lightGray
         /*adds a ciruclar mask to the image-view*/
         let cornerRadius = self.contentView.frame.height/2
         //Swift.print("cornerRadius:  \(cornerRadius)")
         $0.layer.cornerRadius = cornerRadius
         $0.clipsToBounds = true
         self.contentView.addSubview($0)
         /*adds constraints*/
         $0.translatesAutoresizingMaskIntoConstraints = false
         let tl = Constraint.anchor($0, to: self.contentView, align: .topLeft, alignTo: .topLeft, offset:.zero, useMargin:true)
         let bl = Constraint.anchor($0, to: self.contentView, align: .bottomLeft, alignTo: .bottomLeft, offset:.zero, useMargin:true)
         //let b = Constraint.anchor(view, to: self.contentView, align: .bottom, alignTo: .bottom, offset:0,useMargin:true)
         let size = Constraint.size($0, size: CGSize(width:self.contentView.frame.height,height:self.contentView.frame.height))
         //let x = Constraint.anchor(view, to: self.contentView, align: .left, alignTo: .left,offset:0,useMargin:true)
         //let h = Constraint.height(view, to: self)//height, h,h
         NSLayoutConstraint.activate([tl.x,tl.y,size.w,bl.y,bl.x,size.h])
      }
   }
}
