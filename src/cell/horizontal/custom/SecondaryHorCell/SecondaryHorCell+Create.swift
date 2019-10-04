import UIKit
import With
/**
 * Create
 */
extension SecondaryHorCell {
   /**
    * Adds portrait cell sized design
    * - Note: this can also be done after the fact via: self.collectionView.setCollectionViewLayout(customLayout, animated: false), but this isnt as optimized
    */
   override func createLayout() -> UICollectionViewFlowLayout {
      return with(.init()) {
         let margin: CGFloat = SecondaryHorCell.margin
         $0.sectionInset = .init(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin/*vertical spacing*/
         $0.itemSize = with(.zero) {
            let screenWidth: CGFloat = UIScreen.main.bounds.size.width
            $0.width = (screenWidth - (margin * 3)) / 2
            $0.height = $0.width + ($0.width * 0.33)
         }
      }
   }
}
