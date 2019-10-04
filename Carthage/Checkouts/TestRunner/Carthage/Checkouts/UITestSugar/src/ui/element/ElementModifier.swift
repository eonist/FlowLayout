import Foundation
import XCTest
/**
 * TextField manipulation
 */
public class ElementModifier {
   /**
    * Removes any current text in the field before typing in the new value
    * - Parameter text: the text to enter into the field
    * - Fixme: ⚠️️ Consider making this a try error method
    * - Important: FOR PASSWORD-FIELDS you may need to read this: https://stackoverflow.com/questions/32184837/ui-testing-failure-neither-element-nor-any-descendant-has-keyboard-focus-on-se
    * - Remark: you can also use: typeKey(_ key: String, modifierFlags flags: XCUIElement.KeyModifierFlags) t
    */
   public static func clearAndTypeText(element: XCUIElement, text: String) {
      guard let stringValue = element.value as? String else {
         XCTFail("Tried to clear and enter text into a non string value")
         return
      }
      element.tap()
      for _ in 0..<stringValue.count { // Fixme: ⚠️️ do .forEach here
         element.typeText(XCUIKeyboardKey.delete.rawValue)
      }
      if stringValue.isEmpty { element.tap() }
      element.typeText(text)
   }
   /**
    * Scrolling
    * Fixme: ⚠️️ write doc
    * - Note try to set cells: cell.accessibilityIdentifer = "cell \(indexPath.row)"
    * - Note: there is also Native: firstScrollView.scrollToElement(element: seventhChild)
    */
   public static func scrollToElement(element: XCUIElement) {
      while !ElementAsserter.visible(element: element) {
         element.swipeDown()
      }
   }
}
/**
 * Alternate Clear and type methodology
 */
extension ElementModifier {
   /**
    * Returns `value` as a String
    * ## Examples:
    * app.textFields.element.text
    * - Note: It will fail if `value` is not a `String` type.
    */
   private static func getText(element: XCUIElement) -> String {
      guard let text = element.value as? String else {
         preconditionFailure("Value: \(String(describing: element.value)) is not a String")
      }
      return text
   }
   /**
    * Remove text from textField or secureTextField.
    * ## Examples:
    * clearTextField(element: app.textFields.element)
    */
   private static func clearTextField(element: XCUIElement) {
      var previousValueLength = 0
      while getText(element: element).count != previousValueLength { // Keep removing characters until text is empty, or removing them is not allowed.
         previousValueLength = getText(element: element).count
         element.typeText("\u{8}")
      }
   }
   /**
    * Remove text from textField and enter new value.
    * - Note: Useful if there is chance that the element contains text already.
    * - Note: This helper method will execute `clearTextField` and then type the provided string.
    * - Parameter text: Text to type after clearing old value.
    * ## Examples:
    * clear(element: app.textFields.element, andType: "text")
    */
   public static func clearAndType(element: XCUIElement, text: String) {
      element.tap()
      clearTextField(element: element)
      element.typeText(text)
   }
}
/**
 * Slider
 */
extension ElementModifier {
   /**
    * ## Examples:
    * slide(slider: app.sliders.element, amount: 0.7)
    */
   public static func slide(slider: XCUIElement, amount: CGFloat) {
      slider.adjust(toNormalizedSliderPosition: amount)
   }
}
/**
 * Pickerwheel
 */
extension ElementModifier {
   /**
    * ## Examples:
    * pick(pickerWheel: app.pickerWheels.element, value: "Picker Wheel Item Title")
    * pick(pickerWheel: ElementParser.firstElement(query:  app.pickerWheels, identrifier: "first picker", type:.picker), value: "Picker Wheel Item Title")
    */
   public static func pick(pickerWheel: XCUIElement, value: String) {
      pickerWheel.adjust(toPickerWheelValue: value)
   }
}
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
    * - Parameter link: could be the link text or id ⚠️️ testing needed
    */
   public static func link(app: XCUIApplication, title: String) -> XCUIElement {
      return app.links[title]
   }
}
/**
 * Alert
 */
extension ElementModifier {
   /**
    * Return a button in an alert
    * - Important: ⚠️️ You can setup handlers for random alert screens: addUIInterruptionMonitor(withDescription: "Location Dialog") { (alert) -> Bool in alert.buttons["Allow"].tap() return true }
    * - 
    */
   public static func alert(app: XCUIApplication, alertTitle: String, alerButtonTitle: String) -> XCUIElement {
      return app.alerts[alertTitle].buttons[alerButtonTitle]
   }
}
/**
 * Table
 */
extension ElementModifier {
   /**
    * ⚠️️ Beta ⚠️️
    */
   public static func pullToRefresh(tableElement: XCUIElement) {
      let firstCell: XCUIElement = tableElement.children(matching: .cell).firstMatch
      let start = firstCell.coordinate(withNormalizedOffset: .init(dx: 0, dy: 0))
      let finish = firstCell.coordinate(withNormalizedOffset: .init(dx: 0, dy: 6))
      start.press(forDuration: 0, thenDragTo: finish)
   }
   /**
    * ⚠️️ Beta ⚠️️
    */
   public static func cell(app: XCUIApplication, idx: Int) -> XCUIElement {
      return app.tables.cells.element(boundBy: idx)
   }
}
