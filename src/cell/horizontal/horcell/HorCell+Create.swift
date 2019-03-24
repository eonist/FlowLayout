import UIKit
import With
/**
 * Create
 */
extension HorCell{
   /**
    * - Note: overrideable with subclass
    * - Note: flowLayout.scrollDirection is vertical by default
    */
   @objc open func createLayout() -> UICollectionViewFlowLayout{
      return  with(.init()){
         let margin:CGFloat = 32//TODO: ⚠️️ move to const
         $0.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin/*Vertical spacing*/
         let size:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            let width:CGFloat = (screenWidth - (margin*3)) / 2
            let height:CGFloat = width//width +  (width * 0.33)
            return CGSize(width: width, height: height)
         }()
         $0.itemSize = size
      }
   }
}
