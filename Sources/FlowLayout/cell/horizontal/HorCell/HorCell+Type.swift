#if os(iOS)
import UIKit
/**
 * Helper
 */
extension HorCell {
   typealias OnScroll = (_ yOffset: CGFloat) -> Void // Needed to get the sticky header to work
   typealias OnItemSelect = (_ indexPath: IndexPath) -> Void
}
#endif
