import Foundation
/**
 * Interaction
 */
extension PrimaryHorCell{
   /**
    * - Abstract: Example how we can change the layout of the collectionview on interaction
    */
   func itemSelect(indexPath: IndexPath){
      // Swift.print("PrimaryCell.itemSelect() - indexPath:  \(indexPath)")
      collectionView.collectionViewLayout.invalidateLayout()
      collectionView.collectionViewLayout = createAlternateLayout()
      updateCollectionView()
      //      let itemSize:CGSize = {
      //         let screenWidth:CGFloat = UIScreen.main.bounds.size.width
      //         let width:CGFloat = screenWidth - (SecondaryCell.margin*2)
      //         let height:CGFloat = width
      //         return .init(width: width, height: height)
      //      }()
      //      collectionView.visibleCells.forEach{$0.frame = .init(origin:$0.frame.origin,size:itemSize)}
   }
}
