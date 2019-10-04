import Foundation
import XCTest
/**
 * Scrolling
 */
extension XCUIElement {
   /**
    * Scrolling
    */
   @discardableResult
   public func scrollTo(dir: ElementModifier.Direction, searchCondition: ElementParser.MatchCondition) -> XCUIElement {
      ElementModifier.scrollTo(element: self, dir: dir, searchCondition: searchCondition)
      return self
   }
   /**
    * Scrolling (beta)
    */
   @discardableResult
   public func scrollToElement(element: XCUIElement) -> XCUIElement {
      ElementModifier.scrollToElement(parent: self, element: element)
      return self
   }
   /**
    * Scrolling (beta)
    */
   @discardableResult
   public func scrollTo(searchCondition: ElementParser.MatchCondition) -> XCUIElement {
      ElementModifier.scrollToElement(element: self, searchCondition: searchCondition)
      return self
   }
}
