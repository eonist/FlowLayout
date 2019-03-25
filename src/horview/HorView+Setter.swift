import Foundation

extension HorView{
    /**
     * Set index
     */
    func setIdx(idx:Int){
        //Swift.print("HorView.setIdx(\(idx)")
        header.setTitleIdx(idx: idx)
        setCollectionViewIndex(idx: idx)
    }
    /**
     * Scrolls to collectionview index
     */
    func setCollectionViewIndex(idx:Int){
        //Swift.print("setCollectionViewIndex(\(idx)")
        let indexPath = IndexPath(row: idx, section: 0)
        self.collectionView.scrollToItem(at:indexPath, at: .right, animated: true)
        collectionView.setNeedsLayout()/* ⚠️️ might not be needed*/
        collectionView.layoutIfNeeded()/* ⚠️️ might not be needed*/
    }
}
