import UIKit
/**
 * CollectionView related
 */
extension HorView{
    /**
     * Num of items
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    /**
     * Respawns cells
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell:FlowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as? FlowCell else {fatalError("err")}
        if indexPath.row == HorView.CellType.primary.hashValue {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryCell.id, for: indexPath as IndexPath) as? PrimaryCell else { fatalError("err") }
            cell.data = PrimaryCellData.init(thumbURLS: ["a","b","c","d","a","b","c","d","a","b","c"])
            return cell
        } else if indexPath.row == HorView.CellType.secondary.hashValue {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondaryCell.id, for: indexPath as IndexPath) as? SecondaryCell else { fatalError("err") }
            return cell
        } else if indexPath.row == HorView.CellType.tierary.hashValue {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TertiaryCell.id, for: indexPath as IndexPath) as? TertiaryCell else { fatalError("err") }
            return cell
        } else {
            fatalError("err")
        }
    }
    /**
     *
     */
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width, height: self.frame.height - 50)
//    }
}
