import UIKit
/**
 * Core
 */
extension HorView{
   /**
    * Register cell types
    */
   @objc func registerCellTypes(){
      collectionView.register(PrimaryCell.self, forCellWithReuseIdentifier: PrimaryCell.id)/*Register cell kind*/
      collectionView.register(SecondaryCell.self, forCellWithReuseIdentifier: SecondaryCell.id)
      collectionView.register(TertiaryCell.self, forCellWithReuseIdentifier: TertiaryCell.id)
   }
}

