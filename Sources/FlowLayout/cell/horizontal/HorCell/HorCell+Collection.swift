import UIKit
/**
 * CollectionView related
 */
extension HorCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   /**
    * Num of items in section
    */
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      self.count
   }
   /**
    * Respawns cells @ indexPath
    */
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      dequeCell(cellForItemAt: indexPath)
   }
   /**
    * On item click
    */
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      onItemSelect(indexPath)
   }
}
