import Foundation
import XCTest

public class ElementAsserter {
   /**
    * Asserts if an element is visible on screen (⚠️️ Beta ⚠️️)
    * Fixme: ⚠️️ write example
    */
   public static func visible(element: XCUIElement) -> Bool {
      guard element.exists && !element.frame.isEmpty else { return false }
      return XCUIApplication().windows.element(boundBy: 0).frame.contains(element.frame)
   }
   /**
    * Indicates if the element is currently visible on the screen.  (⚠️️ Beta ⚠️️)
    * ## Examples: XCTAssertTrue(app.buttons.element.isVisible) // ✅
    * - Important: ⚠️️ When accessing properties of XCUIElement, XCTest works differently than in a case of actions on elements, there is no waiting for the app to idle and to finish all animations., This can lead to problems and test flakiness as the test will evaluate a query before e.g. view transition has been completed.
    */
   func isVisible(element: XCUIElement) -> Bool {
     return element.exists && element.isHittable
   }
   /**
    * Asserts if an element exists
    * @Example:
    * XCTAsserstTrue(ElementAsserter.exists(element: app.buttons[“Sign up”])) // ✅
    */
   public static func exists(element: XCUIElement) -> Bool {
      return element.exists
   }
   /**
    * Asserts if an element exists (with timeout)
    * - Abstract:  This method can be used when you expect for an element to appear on the screen but needs to wait for something like an animation, or a video ad, or simply because of load time. This property was introduced in XCode 9, though we have used API similar to this to test features that involve waiting through video ads.
    * ## Examples:
    * ElementAsserter.exists(element: app.buttons[“Sign up”], timeout: 10)
    */
   public static func exists(element: XCUIElement, timeout: Double) -> Bool {
      return element.waitForExistence(timeout: timeout) // 
   }
   /**
    * Asserts if all elements in an array exists
    */
   public static func allExists(elements: [XCUIElement]) -> Bool {
      return elements.first { !$0.exists } == nil
   }
   /**
    * ## Examples
    * hasText(element: app.alerts.element,"Please enter a valid email address")
    */
   public static func hasText(element: XCUIElement, text: String) -> Bool {
      return element.staticTexts[text].exists
   }
}
extension ElementAsserter {
   /**
    * - Abstract: Search down a scroll view until it finds a certain element
    * - Note: there is also Native: firstScrollView.scrollToElement(element: seventhChild)
    */
   public static func swipeDownUntilFound(app: XCUIApplication, id: String, type: XCUIElement.ElementType, timeOut: Double = 10) {
      var exists: Bool = false
      repeat {
         let element: XCUIElement = app.descendants(matching: type).element(matching: type, identifier: id).firstMatch
         exists = ElementAsserter.exists(element: element, timeout: timeOut)
         if exists { app.swipeDown() } // no need to swipedown if found
      } while !exists
   }
}
