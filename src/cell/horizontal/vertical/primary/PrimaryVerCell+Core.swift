import UIKit
import With
/**
 * Core
 */
extension PrimaryVerCell{
   /**
    * Adds a UIView that is round
    */
   func drawCircle() {
      let rect:CGRect = .init(origin: .zero, size: .init(width: self.frame.width, height: self.frame.width))
      with(UIView.init(frame: rect)){
         $0.layer.cornerRadius = self.frame.width/2
         $0.layer.masksToBounds = true
         $0.backgroundColor = UIColorParser.random
         addSubview($0)
      }
   }
}
