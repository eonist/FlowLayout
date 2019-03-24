import UIKit
/**
 * A BrowserPage is contained within a BrowserView
 */
open class HorView:UIView,UICollectionViewDataSource,UICollectionViewDelegate{
   lazy var header:Header = self.createHeader()
   lazy var collectionView:UICollectionView = self.createCollectionView()
   var items:[CellType]
   var curPage:Int = -1
   override public init(frame: CGRect) {
      items = [.primary, .secondary, .tierary]
      super.init(frame: frame)
      self.backgroundColor = UIColor.blue//debug
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
