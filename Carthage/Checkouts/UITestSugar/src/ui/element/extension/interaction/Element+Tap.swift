import Foundation
import XCTest
/**
 * Tapping
 */
extension XCUIElement {
   /**
    * Helps to tap things that doesn't work with regular .tap() calls. as .tap() calls must be on .isHittable items
    * - Caution: ⚠️️ If you use this method in conjunction with: .isVisibleInWindow call. This method can still fail. If something is covering the element or is slightly within window etc
    */
   @discardableResult
   public func forceTapElement() -> XCUIElement {
      if self.isHittable {
         self.tap()
      } else {
         let offset: CGPoint = .zero//.init(x: self.frame.origin.x + (self.frame.size.width / 2), y: self.frame.origin.y + (self.frame.size.height / 2))
         let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: .init(dx: offset.x, dy: offset.y))
         coordinate.tap()
      }
      return self
   }
   /**
    * Adds convenient way to tap and then wait for a duration (seconds)
    * - Abstract: It's more natural to wait a bit after a tap
    * ## Examples:
    * app.buttons.firstMatch.tap(waitAfter: 0.2)
    */
   @discardableResult
   public func tap(waitAfter sec: Double) -> XCUIElement {
      self.tap()
      return self.wait(after: sec)
   }
   /**
    * Wait for existence then tap
    * ## Examples:
    * app.buttons.firstMatch.tap(waitForExistence: 0.2)
    * - Remark: waitForExistence is a natice call
    */
   @discardableResult
   public func tap(waitForExistence sec: Double) -> XCUIElement? {
      guard self.waitForExistence(timeout: sec) else { return nil }
      self.tap()
      return self
   }
   /**
    * Wait for existence, then tap, then sleep
    * ## Examples:
    * app.buttons.firstMatch.tap(waitForExistence: 0.2, waitAfter: 2.0)
    */
   @discardableResult
   public func tap(waitForExistence secs: Double, waitAfter sleepSecs: Double) -> XCUIElement? {
      guard self.waitForExistence(timeout: secs) else { return nil }
      self.tap()
      return self.wait(after: sleepSecs)
   }
}
