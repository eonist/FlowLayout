import Foundation
import XCTest
/**
 * Other
 */
extension XCUIElement {
   /**
    * A convenient way to add some time after a call
    */
   @discardableResult
   public func wait(after sleepSecs: Double) -> XCUIElement {
      sleep(sec: sleepSecs)
      return self
   }
   /**
    * Checks if an item exists and is hittable, if it's not hittable then the app is tapped so that the tooltip goes away
    */
   @discardableResult
   public func disregardToolTip() -> XCUIElement {
      let elementExists = self.waitForExistence(timeout: 10)
      if elementExists && self.isHittable == false { // Most likely tooltip is beeing show and this needs to be dismissed
         XCUIApplication().tap(waitForExistence: 5, waitAfter: 2)
      }
      return self
   }
   /**
    * Same as adjust, but returns self for chaining calls
    * - Remark: We can't use adjust as it's a native call
    */
   @discardableResult
   public func slide(_ scalar: CGFloat) -> XCUIElement {
      self.adjust(toNormalizedSliderPosition: scalar)
      return self
   }
}
