import UIKit
/**
 * Core
 */
extension HorView {
   /**
    * Register cell types
    */
   @objc func registerCellTypes() {
      collectionView.register(PrimaryHorCell.self, forCellWithReuseIdentifier: PrimaryHorCell.id) // Register cell kind
      collectionView.register(SecondaryHorCell.self, forCellWithReuseIdentifier: SecondaryHorCell.id)
      collectionView.register(TertiaryHorCell.self, forCellWithReuseIdentifier: TertiaryHorCell.id)
   }
}
