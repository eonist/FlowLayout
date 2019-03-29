import UIKit
import With
/**
 * Create
 */
extension SecondaryHorCell{
   /**
    * Adds portrait cell design
    * - Note: this can also be done after the fact via: self.collectionView.setCollectionViewLayout(customLayout, animated: false), but this isnt as optimized
    */
   override func createLayout() -> UICollectionViewFlowLayout {
      return with(.init()){
         let margin:CGFloat = SecondaryHorCell.margin
         $0.sectionInset = .init(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin/*vertical spacing*/
         let itemSize:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            let width:CGFloat = (screenWidth - (margin*3)) / 2
            let height:CGFloat = width +  (width * 0.33)
            return .init(width: width, height: height)
         }()
         $0.itemSize = itemSize//CGSize(width: 70, height: 70)
      }
   }
}
