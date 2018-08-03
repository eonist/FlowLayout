import UIKit

class SecondaryCell:HorCell{
    override class var id : String {return "\(SecondaryCell.self)"}
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray//UIColorParser.random
//        self.collectionView.setCollectionViewLayout(customLayout, animated: false)
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * Adds portrait cell design    
     */
    override func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let margin:CGFloat = 32//TODO: ⚠️️ move to const
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = margin//vertical spacing
        let size:CGSize = {
            let screenWidth:CGFloat = UIScreen.main.bounds.size.width
            Swift.print("screenWidth:  \(screenWidth)")
            Swift.print("self.view.frame.width:  \(self.frame.width)")
            let width:CGFloat = (screenWidth - (margin*3)) / 2
            let height:CGFloat = width +  (width * 0.33)
            return CGSize(width: width, height: height)
        }()
        layout.itemSize = size//CGSize(width: 70, height: 70)
        return layout
    }
}
//extension SecondaryCell{
//    var customLayout:UICollectionViewFlowLayout {
//
//    }
//}
