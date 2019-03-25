import UIKit
/**
 * TODO: ⚠️️ Rename to PrimaryHorCell
 */
class PrimaryCell:BaseHorCell<PrimaryCellData>{
   override class var id:String {return "\(PrimaryCell.self)"}/*Used for dequeing cells*/
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .lightGray
   }
   /**
    * When you set the data, the diferent UI's will be updated
    */
   override var data:PrimaryCellData? { didSet {
      guard let data = data else {fatalError("data not avaiable")}
      _ = data
      updateCollectionView()/* updates the collection view with data */
      }
   }
   override var count: Int {return data?.thumbURLS.count ?? 0}
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
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
      if let thumbURL:String = data?.thumbURLS[indexPath.row] {
         Swift.print("thumbURL:  \(thumbURL)")
         //cell.thumbImage = UIImage(url:thumbURL)
         //cell.imgView.setImage(webPath: thumbURL)
      }
      return cell
   }
}
