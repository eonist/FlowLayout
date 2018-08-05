import UIKit
/**
 * A BrowserPage is contained within a BrowserView
 */
class HorCell:UICollectionViewCell {
    class var id:String {return "\(HorCell.self)"}/*Stores the deque cell id, overrideable in subclasses*/
    lazy var collectionView:UICollectionView = self.createCollectionView()
    var items:[Int] = [0,1,2,3,4,5,7,8,9]
    var count:Int {return items.count}/*override this in subclasses*/
    var onTableViewScrollCallBack:ScrollCallBack = {_ in Swift.print("StoryTableView - no callback attached")}
   
    override init(frame: CGRect) {
        items = [0,1,2,3,4,5,7,8,9]
        super.init(frame: frame)
        self.backgroundColor = .purple
        _ = collectionView/* inits the collectionView, works with empty data, before we get data from remote */
        //updateCollectionView()/*Updates the collection view with data */
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * Override in sub class
     * NOTE: This method exists so that we can subclass HorCell and register different child cell types
     * TODO: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
     */
    func registerCell(collectionView:UICollectionView){
        collectionView.register(VerCell.self, forCellWithReuseIdentifier: VerCell.id)
    }
    /**
     * Override in sub class
     * NOTE: This method exists so that we can subclass HorCell and register different child cell types
     * TODO: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
     */
    func dequeCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell:VerCell = collectionView.dequeueReusableCell(withReuseIdentifier: VerCell.id, for: indexPath as IndexPath) as? VerCell else {fatalError("err")}
        return cell
    }
    /**
     * Creates collectionview
     */
    func createCollectionView() -> UICollectionView{
        let layout:UICollectionViewFlowLayout = createLayout()
        let collectionView:UICollectionView = {
            let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
            collectionView.dataSource = self/*We must set datasource because the framework is view based not VC based*/
            collectionView.delegate = self/*We must set delegate because the framework is view based not VC based*/
            collectionView.contentInset = UIEdgeInsetsMake(Header.height, 0, 0, 0)/*offsets the content, so that sticky header works etc*/
             collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(Header.height, 0, 0, 0)
            self.registerCell(collectionView:collectionView)/*Register cell kind*/
            collectionView.backgroundColor = .clear/*The HorCell it self also has a bg so we set this to clear*/
            self.addSubview(collectionView)
            /*⚠️️ We have to use a constraint or else the double UICollection setup starts to behave strangly ⚠️️*/
            collectionView.activateConstraint{ view in/*The view needs to use constraints or else AutoLayout wont work with dual UICollectionView*/
                let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
                let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/*-Header.height*/ ))
                return [anchor.x,anchor.y,size.w,size.h]
            }
            return collectionView
        }()
        return collectionView
    }
    /**
     * NOTE: overrideable with subclass
     * NOTE: flowLayout.scrollDirection is vertical by default
     */
    func createLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        let margin:CGFloat = 32//TODO: ⚠️️ move to const
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = margin//vertical spacing
        let size:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            //Swift.print("screenWidth:  \(screenWidth)")
            //Swift.print("self.view.frame.width:  \(self.frame.width)")
            let width:CGFloat = (screenWidth - (margin*3)) / 2
            let height:CGFloat = width//width +  (width * 0.33)
            return CGSize(width: width, height: height)
        }()
        layout.itemSize = size
        return layout
    }
}

