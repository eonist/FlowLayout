import UIKit
//import Spatial

class TopBar:UIView{
//   lazy var buttons:[UIButton] = createButtons()
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .orange
   }
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
