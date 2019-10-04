import Foundation
import XCTest
/**
 * Web
 */
extension ElementModifier {
   /**
    * Return a webview item for title
    * ## Examples:
    * link(app: XCUIApplication(), title: "Tweet this")
    * - Note: you can also do things like: app.webViews.checkBoxes["id"].tap()
    * - Note: you can also use the Accessibility Inspector.app in macos
    * - Note: you can also enable the iOS Simulator's Accessibility Inspector
    * - Note: you can also do: XCUIApplication().staticTexts["content"]
    * - Parameter app: A reference to the app
    * - Parameter link: Could be the link text or id ⚠️️ testing needed
    */
   public static func link(app: XCUIApplication, title: String) -> XCUIElement {
      return app.links[title]
   }
}
