#if os(iOS)
import UIKit
import ReusableCell
/**
 * Core
 */
extension HorView {
   /**
    * Register cell types
    * - Fixme: ⚠️️ make the [].register call
    */
   @objc func registerCellTypes() {
      collectionView.register([PrimaryHorCell.self, SecondaryHorCell.self, TertiaryHorCell.self].map { $0 as HorCell.Type }) // Register Cells with ease
   }
}

#endif
