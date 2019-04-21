import UIKit
import With
import Spatial
/**
 * Header
 */
class ButtonContainer: UIView {
   static let height: CGFloat = 60
   lazy var buttons: [HeaderButton] = self.createButtons()
   var onButtonClick: ButtonClick = {_ in Swift.print("Callback is missing")}
   override init(frame: CGRect) {
      super.init(frame: frame)
      let bg:UIView = .init()
      bg.backgroundColor = .green
      self.addSubview(bg)/*Add a background to*/
      _ = buttons
   }
   /**
    * Boilerplate
    */
   required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Callback signature
 */
extension ButtonContainer{
   typealias ButtonClick = (_ buttonTitle:String) -> Void
}
