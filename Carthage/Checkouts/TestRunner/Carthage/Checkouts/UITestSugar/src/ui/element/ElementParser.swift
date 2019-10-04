import Foundation
import XCTest
/**
 * Parser
 */
public class ElementParser {
   /**
    * Returns children elements for element
    * - Parameter element: parent element
    */
   public static func children(element: XCUIElement, type: XCUIElement.ElementType = .any) -> [XCUIElement] {
      let query: XCUIElementQuery = element.children(matching: type)
      return QueryParser.elements(query: query)
   }
   /**
    * Returns all children 
    */
   public static func descendants(element: XCUIElement, type: XCUIElement.ElementType = .any) -> [XCUIElement] {
      let query: XCUIElementQuery = element.descendants(matching: type)
      return QueryParser.elements(query: query)
   }
   /**
    * Helps identify elements (Useful when there is localization involved)
    * ## Examples:
    * debugChildren(query: app.scrollViews.otherElements.buttons)
    * - Note: to debug descendants use the descendants call in the query
    */
   public static func debug(query: XCUIElementQuery) {
      let elements: [XCUIElement] = query.allElementsBoundByIndex
      elements.forEach { debug(element: $0) }
   }
   /**
    * Helps debug an element
    */
   public static func debug(element: XCUIElement, indentation: String = "") {
      Swift.print("\(indentation)identifier:  \(element.identifier) accessibilityLabel:  \(String(describing: element.accessibilityLabel)) label:  \(element.label) elementType:  \(element.elementType.rawValue) title:  \(element.title)")
   }
   /**
    * Helps debug a hierarchy
    */
   public static func debugHierarchy(element: XCUIElement, type: XCUIElement.ElementType = .any, indentaionLevel: Int = 0) {
      let children = element.children(matching: type).allElementsBoundByIndex
      children.forEach {
         let indentationLevel: Int = indentaionLevel + 1
         let identation: String = .init(repeating: "-", count: indentationLevel)
         debug(element: $0, indentation: identation)
         debugHierarchy(element: $0, type: type, indentaionLevel: indentationLevel) // keep traversing down the hierarchy
      }
   }
}
