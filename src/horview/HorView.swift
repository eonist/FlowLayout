import UIKit
/**
 * - Abstract: the Horisontal view holds the collectionView for the vertical cells
 * - TODO: ⚠️️ In theory it could be an Idea to extend UICollectionView directly, instead of UIView
 */
open class HorView:UIView,UICollectionViewDataSource,UICollectionViewDelegate{
   lazy var header:Header = self.createHeader()
   lazy var collectionView:UICollectionView = self.createCollectionView()
   var items:[CellType]
   override public init(frame: CGRect) {
      items = [.primary, .secondary, .tertiary]
      super.init(frame: frame)
      self.backgroundColor = HorView.style.backgroundColor
      _ = header
      _ = collectionView/* inits the collectionView, works with empty data, before we get data from remote */
      //updateCollectionView() /* updates the collection view with new data etc */
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
