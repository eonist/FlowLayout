import XCTest
import UITestSugar
/**
 * UITest for UITestSugar
 */
class UITest: XCTestCase {
   override func setUp() {
      super.setUp()
      continueAfterFailure = false
      let app = XCUIApplication()
      app.launch()
      Swift.print("test start")
      // Some tests
      _ = {
         //      app.firstDescendant(type: .button).waitToAppear(5)?.tap(waitAfter: 2)
         //      app.firstDescendant(id: "someBtn").waitToAppear(5)?.tap(waitAfter: 2)
         //      app.firstDescendant(type: .button, id: "someBtn").waitToAppear(5)?.tap(waitAfter: 2)
         //      app.firstChild(type: .button, id: "otherBtn").waitToAppear(4)?.tap(waitAfter: 2)
         //      _ = app.descendants([(.table, nil), (.button, nil)])
      }()
      _ = {
         let res1 = ElementParser.element(root: app, index: [3, 0, 0, 0])
         Swift.print("res1:  \(String(describing: res1))")
         let res2 = ElementParser.element(root: app, index: [0, 0, 2, 1])
         Swift.print("res2:  \(String(describing: res2))")
         let res3 = ElementParser.element(root: app, index: [1, 0, 2, 0])
         Swift.print("res3:  \(String(describing: res3))")
         let res4 = ElementParser.element(root: app, index: [])
         Swift.print("res4:  \(String(describing: res4))")
      }
      let btnExists = app.firstDescendant(type: .button).waitForExistence(timeout: 5)
      Swift.print("btnExists:  \(btnExists)")
      let btn2Exists = app.firstDescendant(partialId: "theBtn2", type: .button).waitForExistence(timeout: 5)
      Swift.print("btn2Exists:  \(btn2Exists)")
      Swift.print("test end")
   }
//   override func tearDown() {}
   func testExample() {
      _ = {}()
//            let optionalSelf:XCUIElement? = Optional(self)
//            optionalSelf.waitToAppear(10)?.tap()
   }
}
