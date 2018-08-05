import UIKit
/**
 * CollectionView related
 */
extension HorCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    /**
     * Num of items
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Swift.print("collectionView \(self.count)")
        return self.count
    }
    /**
     * Respawns cells
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Swift.print("collectionView cellForItemAt: \(indexPath)")
        return dequeCell(cellForItemAt: indexPath)
    }
}
