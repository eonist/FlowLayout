import UIKit
/**
 * Override default behaviours
 */
extension Button{
   /**
    * On tap down inside
    */
   override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesBegan(touches, with: event)
      if let touch = touches.first, touch.view == self {/*touch began*/
         onDown()
      }
      super.touchesBegan(touches, with:event)
   }
   /**
    * On tap up inside
    */
   override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesEnded(touches, with: event)
      if let touch = touches.first{/*Touch ended*/
         if touch.view == self {
            let touchPointInButton = touch.location(in: self)
            self.bounds.contains(touchPointInButton) ? onUpInside() : onUpOutside()
         }
         onUp()/*Not sure if this should fire before or after the inside and outside calls*/
      }
   }
   /**
    * NOTE: In a tableview, this is fired if the tap starts to drag the tableview etc
    */
   open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesCancelled(touches, with: event)
      if let _ = touches.first{/*Touch ended*/
         onUp()
      }
   }
}
/**
 * Interactions
 * - TODO: ⚠️️ rename to onUp etc
 */
extension Button {
   /**
    * Overridable
    */
   @objc open func onUp(){
      upCallBack()
   }
   /**
    * Overridable
    */
   @objc open func onUpInside(){
      upInsideCallBack()
   }
   /**
    * Overridable
    */
   @objc open func onUpOutside(){
      upOutsideCallBack()
   }
   /**
    * Overridable
    */
   @objc open func onDown(){
      downCallBack()
   }
}
