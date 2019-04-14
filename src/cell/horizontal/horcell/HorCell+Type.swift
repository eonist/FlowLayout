import UIKit

/**
 * Helper
 */
extension HorCell {
   typealias ScrollCallBack = (_ yOffset:CGFloat) -> Void /*Needed to get the sticky header to work*/
   typealias OnItemSelect = (_ indexPath: IndexPath) -> Void
}
