import UIKit
import With
/**
 * - TODO: ⚠️️ Rename to PrimaryHorCell
 */
class PrimaryHorCell: HorCell{
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.onItemSelect = itemSelect
   }
   /**
    * When you set the data, the diferent UI's will be updated
    */
   override var data: CellDataKind? {
      didSet {
         guard let data = data else { fatalError("data not avaiable") }
         _ = data
         updateCollectionView()/* Updates the collection view with data */
      }
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
