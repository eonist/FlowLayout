import UIKit
import ReusableCell
/**
 * Core
 */
extension HorView {
   /**
    * Register cell types
    */
   @objc func registerCellTypes() {
//      let types: [HorCell.Type] =
      collectionView.register([PrimaryHorCell.self, SecondaryHorCell.self, TertiaryHorCell.self].map { $0 as HorCell.Type }) // Register Cells with ease
   }
}
