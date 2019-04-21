import Foundation

extension HeaderButton{
   /**
    * Selector handler
    */
   @objc func buttonTouched(sender: UIButton) {
      clickCallBack()/*Calls whichever method that is attached to the call-back variable*/
   }
}
