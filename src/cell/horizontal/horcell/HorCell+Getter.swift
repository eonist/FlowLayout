import Foundation
/**
 * Constants
 */
extension HorCell{
   @objc class var id: String {return "\(HorCell.self)"}/*Stores the deque cell id, overrideable in subclasses*/
   @objc var count: Int {return items.count}/*override this in subclasses*/
}
