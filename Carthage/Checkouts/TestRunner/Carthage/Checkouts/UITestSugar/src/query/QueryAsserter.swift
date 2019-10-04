import Foundation
import XCTest

public class QueryAsserter {
   /**
    * ⚠️️ Beta ⚠️️
    */
   public static func waitFor(app: XCUIApplication, testCase: XCTestCase, labelString: String, timeOut: Double = 5) {
      let label = app.staticTexts[labelString]
      let exists = NSPredicate(format: "exists == true")
      testCase.expectation(for: exists, evaluatedWith: label, handler: nil)
      testCase.waitForExpectations(timeout: timeOut, handler: nil)
      XCTAssert(label.exists)
   }
   /**
    * ⚠️️ Beta ⚠️️
    * - Note: wait(for:timeout:) returns an XCTestWaiterResult, an enum representing the result of the test. It can be one of four possible values: completed, timedOut, incorrectOrder, or invertedFulfillment. Only the first, completed, indicates that the element was successfully found within the allotted timeout.
    * - Remark: A big advantage of this approach is that the test suite reads as a synchronous flow. There is no callback block or completion handler. The helper method simply returns a boolean indicating if the element appeared or not.
    */
   public static func waitForElementToAppear(element: XCUIElement, timeOut: Double = 5) -> Bool {
      let existsPredicate = NSPredicate(format: "exists == true")
      let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
      let result = XCTWaiter().wait(for: [expectation], timeout: timeOut)
      return result == .completed
   }
}
//public static func waitForElementToAppear(element: XCUIElement, testCase: XCTestCase) -> Bool {
//   let predicate = NSPredicate(format: "exists == true")
//   let expectation = testCase.expectation(for: predicate, evaluatedWith: element, handler: nil)
//   let result = XCTWaiter().wait(for: [expectation], timeout: 5)
//   return result == .completed
//}
