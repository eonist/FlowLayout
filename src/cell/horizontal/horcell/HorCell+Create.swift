import UIKit
import With
import Spatial
/**
 * Create
 */
extension HorCell{
   /**
    * - Note: overrideable with subclass
    * - Note: flowLayout.scrollDirection is vertical by default
    */
   @objc open func createLayout() -> UICollectionViewFlowLayout{
      return  with(.init()){
         let margin:CGFloat = 32//TODO: ⚠️️ move to const
         $0.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
         $0.minimumInteritemSpacing = 0
         $0.minimumLineSpacing = margin/*Vertical spacing*/
         let size:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            let width:CGFloat = (screenWidth - (margin*3)) / 2
            let height:CGFloat = width//width +  (width * 0.33)
            return CGSize(width: width, height: height)
         }()
         $0.itemSize = size
      }
   }
   /**
    * Creates collectionview
    * - TODO: ⚠️️ replace UIEdgeInsetsMake with .init
    */
   func createCollectionView() -> UICollectionView{
      let layout:UICollectionViewFlowLayout = createLayout()
      return with(.init(frame: self.frame, collectionViewLayout: layout)) {
         $0.dataSource = self/*We must set datasource because the framework is view based not VC based*/
         $0.delegate = self/*We must set delegate because the framework is view based not VC based*/
         $0.contentInset = .init(top: Header.height, left: 0, bottom: 0, right: 0)/*offsets the content, so that sticky header works etc*/
         $0.scrollIndicatorInsets = .init(top: Header.height, left: 0, bottom: 0, right: 0)
         self.registerCell(collectionView:$0)/*Register cell kind*/
         $0.backgroundColor = .clear/*The HorCell it self also has a bg so we set this to clear*/
         self.addSubview($0)
         /*⚠️️ We have to use a constraint or else the double UICollection setup starts to behave strangly ⚠️️*/
         //🏀
         $0.activateConstraints{ view in/*The view needs to use constraints or else AutoLayout wont work with dual UICollectionView*/
            let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/*-Header.height*/ ))
            return [anchor.x,anchor.y,size.w,size.h]
         }
      }
   }
}
