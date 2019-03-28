import UIKit

class HeaderButton:CustomButton{
   var clickCallBack:ClickCallBack = HeaderButton.defaultClickCallBack
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
