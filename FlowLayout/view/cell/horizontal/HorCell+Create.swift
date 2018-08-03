import UIKit

/**
 * Create
 */
extension HorCell{
   
}

//
//
//func createLayout() -> UICollectionViewFlowLayout{
//    Swift.print("createLayout")
//    let layout = UICollectionViewFlowLayout()
//    let margin:CGFloat = 32//TODO: ⚠️️ move to const
//    layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
//    layout.minimumInteritemSpacing = 0
//    layout.minimumLineSpacing = margin//vertical spacing
//    let size:CGSize = {
//        let screenWidth:CGFloat = UIScreen.main.bounds.size.width
//        Swift.print("screenWidth:  \(screenWidth)")
//        //            Swift.print("self.view.frame.width:  \(self.frame.width)")
//        let width:CGFloat = (screenWidth - (margin*3)) / 2
//        let height:CGFloat = width//width +  (width * 0.33)
//        return CGSize(width: width, height: height)
//    }()
//    layout.itemSize = size//CGSize(width: 70, height: 70)
//    return layout
//}
///**
// * Creates collectionview
// */
//func createCollectionView() -> UICollectionView{
//    Swift.print("createCollectionView")
//    let layout:UICollectionViewFlowLayout = createLayout()
//    let collectionView:UICollectionView = {
//        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
//        collectionView.dataSource = self as? UICollectionViewDataSource/*We must set datasource because the framework is view based not VC based*/
//        collectionView.delegate = self as? UICollectionViewDelegate/*We must set delegate because the framework is view based not VC based*/
//        self.registerCell(collectionView:collectionView)/*Register cell kind*/
//        collectionView.backgroundColor = .clear/*The HorCell it self also has a bg so we set this to clear*/
//        self.addSubview(collectionView)
//        /*⚠️️ We have to use a constraint or else the double UICollection setup starts to behave strangly ⚠️️*/
//        collectionView.activateConstraint{ view in/*The view needs to use constraints or else AutoLayout wont work with dual UICollectionView*/
//            let anchor = Constraint.anchor(view, to: self  , align: .topLeft, alignTo: .topLeft)
//            let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//            return [anchor.x,anchor.y,size.w,size.h]
//        }
//        return collectionView
//    }()
//    return collectionView
//}
