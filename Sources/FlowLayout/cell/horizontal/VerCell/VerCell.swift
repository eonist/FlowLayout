#if os(iOS)
import UIKit
/**
 * Browser cell for CollectionView
 * - Fixme: ⚠️️ rename to rowcell?
 */
class VerCell: UICollectionViewCell {
   class var id: String { "\(VerCell.self)" } // Stores the deque cell id, overrideable in subclasses
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = UIColorParser.random
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

#endif
