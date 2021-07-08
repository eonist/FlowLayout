#if os(iOS)
import Foundation
/**
 * Constants
 */
extension HorCell {
   @objc class var id: String { "\(HorCell.self)" } // Stores the deque cell id, overrideable in subclasses
   @objc var count: Int { items.count } // override this in subclasses
}
#endif
