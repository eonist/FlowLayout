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
        if indexPath.row == HorView.CellType.primary.idx {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrimaryCell.id, for: indexPath as IndexPath) as? PrimaryCell else { fatalError("err") }
            let imageURLStr:String = "https://rawgit.com/stylekit/img/master/" + "pic_1_thumb.png"
            let urls:[String] = Array(repeating: "🎉", count: 11)//["a","b","c","d","a","b","c","d","a","b","c"]
            cell.data = PrimaryCellData.init(thumbURLS: urls)/*When you set this, the data is applied to the UI*/
            return cell
        } else if indexPath.row == HorView.CellType.secondary.idx {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondaryCell.id, for: indexPath as IndexPath) as? SecondaryCell else { fatalError("err") }
            return cell
        } else if indexPath.row == HorView.CellType.tierary.idx {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TertiaryCell.id, for: indexPath as IndexPath) as? TertiaryCell else { fatalError("err") }
            return cell
        } else {
            fatalError("err: \(indexPath.row)")
        }
    }
    /**
     *
     */
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.frame.width, height: self.frame.height - 50)
//    }
}
