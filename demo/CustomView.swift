import Foundation
import FlowLayout_iOS

class CustomView:HorView{
   override init(frame: CGRect) {
      super.init(frame: frame)
//      self.backgroundColor = .green//debug
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
