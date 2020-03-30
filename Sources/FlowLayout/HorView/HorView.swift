import UIKit
/**
 * - Abstract: the Horisontal view holds the collectionView for the vertical cells
 * - Fixme: ⚠️️ In theory it could be an Idea to extend UICollectionView directly, instead of UIView
 */
open class HorView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
   lazy var header: Header = self.createHeader()
   lazy var collectionView: UICollectionView = self.createCollectionView()
   var items: [CellType] // Aka columns
   override public init(frame: CGRect = .zero) {
      items = [.primary, .secondary, .tertiary]
      super.init(frame: frame)
      self.backgroundColor = HorView.style.backgroundColor
      _ = header
      _ = collectionView // Inits the collectionView, works with empty data, before we get data from remote
      registerCellTypes() // Register cells
      // updateCollectionView() // updates the collection view with new data etc
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
