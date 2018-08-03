import UIKit
/**
 *
 */
extension HorView{
    /**
     * Creates header
     */
    func createHeader() -> Header{
        let header = Header.sharedInstance/*Header has title,buttons,slider*/
        addSubview(header)
        header.activateConstraint{ view in/*constraints*/
            let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: CGSize(width:UIScreen.main.bounds.width,height:Header.height))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        //_ = createHeaderTitle(header:view)
        return header
    }
    /**
     * Creates collectionview
     */
    func createCollectionView() -> UICollectionView{
        let flowLayout:UICollectionViewFlowLayout = createLayout()
        let collectionView:UICollectionView = {
            let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
            collectionView.dataSource = self/*We must set datasource because the framework is view based not VC based*/
            collectionView.delegate = self/*We must set delegate because the framework is view based not VC based*/
            /*register cells*/
            collectionView.register(PrimaryCell.self, forCellWithReuseIdentifier: PrimaryCell.id)/*Register cell kind*/
            collectionView.register(SecondaryCell.self, forCellWithReuseIdentifier: SecondaryCell.id)
            collectionView.register(TertiaryCell.self, forCellWithReuseIdentifier: TertiaryCell.id) 
            collectionView.backgroundColor = .clear
            collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
            collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            collectionView.isPagingEnabled = true/*makes each cell snap to whole integers*/
            collectionView.showsHorizontalScrollIndicator = false/*hides scrollbar*/
//            self.addSubview(collectionView)
            self.insertSubview(collectionView, belowSubview: header)
            collectionView.activateConstraint{ view in
                let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
                let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height /*- Header.height*/))
                return [anchor.x,anchor.y,size.w,size.h]
            }
            return collectionView
        }()
        return collectionView
    }
    /**
     * Returns layout
     */
    func createLayout() -> UICollectionViewFlowLayout{
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = UIScreen.main.bounds.size/*The size of each collection item*/
        flowLayout.scrollDirection = .horizontal/*Enables horizontal scrolling direction*/
        flowLayout.minimumLineSpacing = 0/*Removes the line-spacing between cells*/
        return flowLayout
    }
}



//            collectionView.dataSource = self
//            collectionView.delegate = self

//
//        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
//        collectionView.dataSource = self
//                    collectionView.delegate = self
//        collectionView.backgroundColor = .white
//        collectionView.register(HorCell.self, forCellWithReuseIdentifier: HorCell.id)
////        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: HomeController.trendingCellId)
////        collectionView.register(SubscriptionCell.self, forCellWithReuseIdentifier: HomeController.subscriptionCellId)
//        collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
//        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
//        collectionView.isPagingEnabled = true
//        return collectionView




//        let layout: UICollectionViewFlowLayout = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            layout.minimumLineSpacing = 0
//            let size:CGSize = {
//                let screenSize:CGSize = UIScreen.main.bounds.size
//                return CGSize(width: screenSize.width, height: screenSize.height)
//            }()
//            Swift.print("size:  \(size)")
//            layout.itemSize = size
//            return layout
//        }()
