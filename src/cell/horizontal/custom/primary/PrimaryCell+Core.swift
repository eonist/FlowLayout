import UIKit
/**
 * Core
 */
extension PrimaryCell{
   /**
    * Register cells for CollectionView
    */
   override func registerCell(collectionView: UICollectionView) {
      collectionView.register(PrimaryVerCell.self, forCellWithReuseIdentifier: PrimaryVerCell.id)
   }
   /**
    * deQue cells for CollectionView
    * - TODO: ⚠️️ remove this method, its superflouse, rather just override the caller
    */
   override func dequeCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell:PrimaryVerCell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryVerCell.id, for: indexPath as IndexPath) as? PrimaryVerCell else {fatalError("err")}
      if let thumbURL:String = primaryCellData?.thumbURLS[indexPath.row] {
         Swift.print("thumbURL:  \(thumbURL)")
         //cell.thumbImage = UIImage(url:thumbURL)
         //cell.imgView.setImage(webPath: thumbURL)
      }
      return cell
   }
}
