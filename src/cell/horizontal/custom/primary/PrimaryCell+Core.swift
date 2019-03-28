import UIKit
import With
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
    * Deques cells for CollectionView
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
   /**
    * Alternate layout
    */
   func createAlternateLayout() -> UICollectionViewFlowLayout {
      return with(.init()){
         let margin:CGFloat = SecondaryCell.margin
         $0.sectionInset = .init(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin/*vertical spacing*/
         let itemSize:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            let width:CGFloat = screenWidth - (margin*2)
            let height:CGFloat = width
            return .init(width: width, height: height)
         }()
         $0.itemSize = itemSize//CGSize(width: 70, height: 70)
      }
   }
}
