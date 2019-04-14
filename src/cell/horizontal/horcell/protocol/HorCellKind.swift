import UIKit

protocol HorCellKind:UIView {
   var collectionView: VerItemViewKind {get set}
   var items: [Int] {get set}/*Vertical items*/
   var onScroll: ScrollCallBack {get set}
   var onItemSelect: OnItemSelect {get set}
   var data: CellDataKind? {get set}/*Stores cellData*/
}

/**
 * Helper
 */
extension HorCellKind{
   typealias ScrollCallBack = (_ yOffset:CGFloat) -> Void /*Needed to get the sticky header to work*/
   typealias OnItemSelect = (_ indexPath: IndexPath) -> Void
}
