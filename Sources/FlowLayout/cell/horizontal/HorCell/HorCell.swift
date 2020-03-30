import UIKit
import With
import Spatial
import ReusableCell
/**
 * - Abstract A horizontal Cell that has a vertical collectionView
 * - Note: This class is later subclassed as a generic class, and as such overriding things in extension doesn't work
 */
class HorCell: UICollectionViewCell, ReusableCellKind {
   lazy var collectionView: UICollectionView = self.createCollectionView() // Vertical collection view
   var items: [Int] // Vertical items
   var onScroll: OnScroll = defaultOnScroll
   var onItemSelect: OnItemSelect = defaultOnItemSelect
   var data: CellDataKind? // Stores cellData
   /**
    * Initiate
    */
   override init(frame: CGRect) {
      items = [0, 1, 2, 3, 4, 5, 7, 8, 9] // Dummy model data
      super.init(frame: frame)
      _ = collectionView // Initiates the collectionView, works with empty data, before we get data from remote
      self.backgroundColor = HorView.style.horCollectionViewBackgroundColor
      // updateCollectionView() // Updates the collection view with data
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
