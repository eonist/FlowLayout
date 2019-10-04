import Foundation
import XCTest

/**
 * Extension
 */
extension XCUIElementQuery {
   /**
    * Returns all descendants of a query that are hittable
    * ## Examples:
    * XCUIApplication().descendants(matching: .any).hittableElements.count // n
    */
   public var hittableElements: [XCUIElement] {
      return QueryHelper.hittableElements(query: self)
   }
}
/**
 * Query extension for element
 */
extension XCUIElement {
   /**
    * - Abstract: This method is needed because the native `.waitForExistence(timeOut:)` doesn't work on optional elements
    * - Remark we had to change the name to something different than waitToAppear, or else chaining would be ambigouse
    * ## Examples:
    * let didAppear: Bool = app.firstDescendant { $0.elementType == .table }.waitForAppearance(10)
    * - Fixme: ⚠️️ you could implement the: native: waitForExistence call and the just return the element
    * - Fixme: ⚠️️ Make this not require result
    */
   public func waitForAppearance(_ timOut: Double = 5) -> Bool {
      return QueryAsserter.waitForElementToAppear(element: self, timeOut: timOut)
   }
   /**
    * - Remark: Great for chaining calls (where UI might not be ready because of network delays etc)
    * ## Examples:
    * app.firstDescendant { $0.elementType == .table }.waitToAppear(10).tap()
    * - Fixme: ⚠️️ Make this not require result
    */
   public func waitToAppear(_ timOut: Double = 5) -> XCUIElement? {
      _ = QueryAsserter.waitForElementToAppear(element: self, timeOut: timOut)
      return self
   }
}
