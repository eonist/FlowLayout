import Foundation
import XCTest

public class QueryParser {
   /**
    * Returns first element by identifier
    * ## Examples:
    * firstElement(query: app.descendants(matching: .any), identifier:"Featured Playlists-View all")
    * firstElement(query: app.scrollViews.descendants(matching: .any), id: "leftAlignedIconButton", type: .button)
    * - Parameter type: .other (UIView), .cell (UICollectionViewCell or UITableViewCell), .button (UIButton)
    */
    public static func firstElement(query: XCUIElementQuery, id: String, type: XCUIElement.ElementType = .any) -> XCUIElement {
      return query.element(matching: type, identifier: id).firstMatch
   }
   //   public static func firstElement(query: XCUIElementQuery, identifier: String, type: XCUIElement.ElementType = .any) -> XCUIElement? {
   //      let elements: [XCUIElement] = QueryParser.elements(query: query, type: type)
   //      return elements.first { $0.identifier == identifier }
   //   }
   /**
    * Returns elements in query
    * - Parameter query: the search query to match parent element
    * - Fixme: ⚠️️ write example
    * - Important: you can use the native: .allElementsBoundByIndex, there is also one for only items with accessibility
    */
   public static func elements(query: XCUIElementQuery, type: XCUIElement.ElementType = .any) -> [XCUIElement] {
      return (0..<query.count).indices.map { i in
         query.children(matching: type).element(boundBy: i)// bound by is a way to access element by index
      }
   }
   /**
    * Returns element of ElementType
    * - Parameter: .button, .scrollBar, .checkButton etc
    * ## Example:
    * app.element(query: app.children, type: .button)
    */
   public static func firstElement(query: XCUIElementQuery, type: XCUIElement.ElementType) -> XCUIElement {
      return query.children(matching: type).element
   }
   /**
    * ## Example:
    * let firstElement = app.filterElements(query: app.children, labels: ["Sugar", "500 g"]).first?.element
    * firstElement.tap()
    */
   public static func firstElement(query: XCUIElementQuery, labels: [String] ) -> XCUIElement? {
      return labels.map { label in
         query.containing(NSPredicate(format: "label CONTAINS %@", label))
      }.compactMap { $0 }.first?.element
   }
   /**
    * Find element that has either of the labels provided in strings
    * ## Examples:
    * let app = XCUIApplication()
    * let element: AppParser.filterElements(query: app.children, strings: ["Sugar", "500 g"], type: .any).element
    * element.exists // true , false
    * element.first.tap()
    * // Cells
    * let cells = AppParser.children(query: app.children, strings: "Sugar", "500 g", .cells).element
    * cells.exists // true , false
    * cells.firstMatch.tap()
    */
   public static func children(query: XCUIElementQuery, strings: [String], type: XCUIElement.ElementType = .any) -> [XCUIElement] {
      // Fixme: ⚠️️ Use .map or reduce or flatmap here
      var retVal: [XCUIElement] = []
      for string in strings {
         let predicate = NSPredicate(format: "label CONTAINS %@", string)
         let elementQuery: XCUIElementQuery = query.containing(predicate)
         let elements: [XCUIElement] = QueryParser.elements(query: elementQuery)
         retVal += elements
      }
      return retVal
   }
}
