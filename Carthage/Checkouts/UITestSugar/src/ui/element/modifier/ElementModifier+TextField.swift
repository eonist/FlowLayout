import Foundation
import XCTest
/**
 * TextField manipulation
 */
public class ElementModifier {
   /**
    * Removes any current text in the field before typing in the new value
    * - Important: ⚠️️ This solution has problems with long pre-existing texts. Basically it taps in the middle of the textfield, and thus half doesnt get cleared. Try to find a better solution
    * - Parameter element: the element to clear and type text into
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
      element.tap(waitForExistence: 5, waitAfter: 0.5)
      for _ in 0..<stringValue.count { // Fixme: ⚠️️ do stringValue.forEach {_ in } here, test first
         element.typeText(XCUIKeyboardKey.delete.rawValue)
      }
      if stringValue.isEmpty { element.tap() }
      element.typeText(text)
   }
   /**
    * Clears searchfield and types text
    * ## Examples:
    * app.searchFields.firstMatch
    */
   public static func clearSearchFieldAndType(searchField: XCUIElement, text: String) {
      searchField.tap(waitForExistence: 5, waitAfter: 0.2)
      searchField.buttons.firstMatch.tap(waitForExistence: 5, waitAfter: 0.2)
      searchField.typeText(text)
   }
}
/**
 * Alternate Clear and type methodology
 */
extension ElementModifier {
   /**
    * Returns `value` as a String
    * - Parameter element: The element to get text from
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
    * Remove text from textField and enter new value.
    * - Note: Useful if there is chance that the element contains text already.
    * - Note: This helper method will execute `clearTextField` and then type the provided string.
    * - Parameter element: The element to clear and type on
    * - Parameter text: Text to type after clearing old value.
    * ## Examples:
    * clear(element: app.textFields.element, andType: "text")
    */
   public static func clearAndType(element: XCUIElement, text: String) {
      element.tap()
      clearTextField(element: element)
      element.typeText(text)
   }
   /**
    * Remove text from textField or secureTextField. ⚠️️ Beta ⚠️️
    * ## Examples:
    * clearTextField(element: app.textFields.element)
    * - Parameter element: The element to clear
    */
   private static func clearTextField(element: XCUIElement) {
      var previousValueLength = 0
      while getText(element: element).count != previousValueLength { // Keep removing characters until text is empty, or removing them is not allowed.
         previousValueLength = getText(element: element).count
         element.typeText("\u{8}")
      }
   }
}
