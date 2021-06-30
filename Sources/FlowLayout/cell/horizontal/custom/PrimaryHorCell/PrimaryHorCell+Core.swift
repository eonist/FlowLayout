import UIKit
import With
/**
 * Core
 */
extension PrimaryHorCell {
   /**
    * Register cells for CollectionView
    */
   override func registerCell(collectionView: UICollectionView) {
      collectionView.register(PrimaryVerCell.self, forCellWithReuseIdentifier: PrimaryVerCell.id)
   }
   /**
    * Deques cells for CollectionView
    * - Fixme: ⚠️️ Remove this method, it's superflouse, rather just override the caller
    */
   override func dequeCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell: PrimaryVerCell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryVerCell.id, for: indexPath as IndexPath) as? PrimaryVerCell else { fatalError("err") }
      if let thumbURL: String = primaryCellData?.thumbURLS[indexPath.row] {
         _ = thumbURL
//         Swift.print("PrimaryHorCell.dequeCell() thumbURL:  \(thumbURL)")
         //cell.thumbImage = UIImage(url:thumbURL)
         //cell.imgView.setImage(webPath: thumbURL)
      }
      return cell
   }
   /**
    * Alternate layout
    * - Fixme: ⚠️️ add more doc
    */
   func createAlternateLayout() -> UICollectionViewFlowLayout {
      with(.init()) {
         let margin: CGFloat = SecondaryHorCell.margin
         $0.sectionInset = .init(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin // vertical spacing
         let itemSize: CGSize = {
            let screenWidth: CGFloat = UIScreen.main.bounds.size.width
            let width: CGFloat = screenWidth - (margin * 2)
            let height: CGFloat = width
            return .init(width: width, height: height)
         }()
         $0.itemSize = itemSize//CGSize(width: 70, height: 70)
      }
   }
}
