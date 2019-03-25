import UIKit
import Spatial
import With
/**
 * HorView
 */
extension HorView{
   /**
    * Creates header
    */
   func createHeader() -> Header{
      return with(Header.sharedInstance) {/*Header has title,buttons,slider*/
         addSubview($0)
         $0.anchorAndSize(to: self, height: Header.height )
      }
   }
   /**
    * Creates collectionview
    */
   func createCollectionView() -> UICollectionView{
      let flowLayout:UICollectionViewFlowLayout = createLayout()
      return with(.init(frame: self.frame, collectionViewLayout: flowLayout)){
         $0.dataSource = self/*We must set datasource because the framework is view based not VC based*/
         $0.delegate = self/*We must set delegate because the framework is view based not VC based*/
         /*Register cells*/
         $0.register(PrimaryCell.self, forCellWithReuseIdentifier: PrimaryCell.id)/*Register cell kind*/
         $0.register(SecondaryCell.self, forCellWithReuseIdentifier: SecondaryCell.id)
         $0.register(TertiaryCell.self, forCellWithReuseIdentifier: TertiaryCell.id)
         $0.backgroundColor = .clear
         $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
         $0.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
         $0.isPagingEnabled = true/*Makes each cell snap to whole integers*/
         $0.showsHorizontalScrollIndicator = false/*Hides scrollbar*/
         //self.addSubview(collectionView)
         self.insertSubview($0, belowSubview: header)
         $0.anchorAndSize(to: self )
      }
   }
   /**
    * Returns layout
    */
   func createLayout() -> UICollectionViewFlowLayout{
      return with(.init()) {
         $0.itemSize = UIScreen.main.bounds.size/*The size of each collection item*/
         $0.scrollDirection = .horizontal/*Enables horizontal scrolling direction*/
         $0.minimumLineSpacing = 0/*Removes the line-spacing between cells*/
      }
   }
}

