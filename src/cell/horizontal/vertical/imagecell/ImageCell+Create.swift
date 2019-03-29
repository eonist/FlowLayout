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
         $0.layer.cornerRadius = cornerRadius
         $0.clipsToBounds = true
         self.contentView.addSubview($0)
         /*adds constraints*/
         $0.translatesAutoresizingMaskIntoConstraints = false
         $0.anchorAndSize(to: contentView ) 
      }
   }
}
