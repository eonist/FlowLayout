import UIKit
import ReusableCell
/**
 * CollectionView related
 */
extension HorView {
   /**
    * Num of items in table
    */
   public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      items.count
   }
   /**
    * Respawns cells
    * - Fixme: ⚠️️ use simpler code for dequeuing cells, see cell frameworks
    */
   public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell: HorCell = {
         switch indexPath.row {
         case ColumnCellType.primary.idx:
            let cell: PrimaryHorCell = collectionView.dequeueReusableCell(indexPath: indexPath)
            let imageURLStr: String = "https://rawgit.com/stylekit/img/master/" + "pic_1_thumb.png"
            _ = imageURLStr
            let urls: [String] = .init(repeating: "🎉", count: 11) // ["a","b","c","d","a","b","c","d","a","b","c"]
            cell.data = PrimaryCellData(thumbURLS: urls) // When you set this, the data is applied to the UI
            return cell
         case ColumnCellType.secondary.idx:
            guard let cell: SecondaryHorCell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondaryHorCell.id, for: indexPath as IndexPath) as? SecondaryHorCell else { fatalError("err") }
            return cell
         case ColumnCellType.tertiary.idx:
            guard let cell: TertiaryHorCell = collectionView.dequeueReusableCell(withReuseIdentifier: TertiaryHorCell.id, for: indexPath as IndexPath) as? TertiaryHorCell else { fatalError("err") }
            return cell
         default: fatalError("err: \(indexPath.row)")
         }
      }()
      // We add onScroll callback to every cell
      cell.onScroll = onVerticalScroll // Attach scoll-call-back-closure
      // cell.onItemSelect = {indexPath in Swift.print("HorView.cell.onItemSelect: \(indexPath) in cellIdx:\(self.currentPageIndex)")}//callback for cell click
      return cell
   }
}
/**
 * This method is interesting, might be able to have different sized cells in the same collectionview
 */
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width, height: self.frame.height - 50)
//    }
