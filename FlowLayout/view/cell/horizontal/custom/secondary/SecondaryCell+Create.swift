import UIKit
import With
/**
 * Create
 */
extension SecondaryCell{
   /**
    * Adds portrait cell design
    * - Note: this can also be done after the fact via: self.collectionView.setCollectionViewLayout(customLayout, animated: false), but this isnt as optimized
    */
   override func createLayout() -> UICollectionViewFlowLayout {
      return with(.init()){
         let margin:CGFloat = SecondaryCell.margin
         $0.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin/*vertical spacing*/
         let size:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            let width:CGFloat = (screenWidth - (margin*3)) / 2
            let height:CGFloat = width +  (width * 0.33)
            return CGSize(width: width, height: height)
         }()
         $0.itemSize = size//CGSize(width: 70, height: 70)
      }
   }
}
