import UIKit
import With
/**
 * Primary vertical cell
 */
class PrimaryVerCell:VerCell{
   override class var id:String {return "\(PrimaryCell.self)"}/*Stores the deque cell id*/
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .clear
      drawCircle()
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
