import UIKit
/**
 *  headerButton
 */
final class HeaderButton: CustomButton {
   var clickCallBack: OnTap = HeaderButton.defautOnTap
   override init(title: String) {
      super.init(title: title)
      self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
