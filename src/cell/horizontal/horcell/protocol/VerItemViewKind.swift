import Foundation
/**
 * - Abstract: Basically Collectionview or tableview
 */
protocol VerItemViewKind: UIDataSourceTranslating, UIFocusItemScrollableContainer {
   func reloadData()
}

extension UICollectionView: VerItemViewKind{}
