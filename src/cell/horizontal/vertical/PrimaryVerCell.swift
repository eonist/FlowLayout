import UIKit
import With
/**
 * Primary vertical cell
 */
class PrimaryVerCell:VerCell{
   override class var id : String {return "\(PrimaryCell.self)"}
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .clear
      drawCircle()
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension PrimaryVerCell{
   /**
    * Adds a UIView that is round
    */
   private func drawCircle() {
      let rect:CGRect = .init(origin: .zero, size: .init(width: self.frame.width, height: self.frame.width))
      with(UIView.init(frame: rect)){
         $0.layer.cornerRadius = self.frame.width/2
         $0.layer.masksToBounds = true
         $0.backgroundColor = UIColorParser.random
         addSubview($0)
      }
   }
}
