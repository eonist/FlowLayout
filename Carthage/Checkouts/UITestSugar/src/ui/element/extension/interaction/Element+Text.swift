import Foundation
import XCTest
/**
 * Text
 */
extension XCUIElement {
   /**
    * Removes any current text in the field before typing in the new value
    * - Parameter text: the text to enter into the field
    */
   @discardableResult
   public func clearAndTypeText(text: String) -> XCUIElement {
      ElementModifier.clearAndTypeText(element: self, text: text)
      return self
   }
   /**
    * Same as typeText, but returns self for chaining calls
    * - Remark: We can't use typeText as it's a native call
    */
   @discardableResult
   public func typeString(_ text: String) -> XCUIElement {
      self.typeText(text)
      return self
   }
   /**
    * Clear SearchField and type
    */
   @discardableResult
   public func clearSearchFieldAndType(text: String) -> XCUIElement {
      ElementModifier.clearSearchFieldAndType(searchField: self, text: text)
      return self
   }
}
