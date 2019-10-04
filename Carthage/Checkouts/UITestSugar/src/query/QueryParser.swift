import Foundation
import XCTest

public class QueryParser {
   /**
    * Returns first element by identifier
    * ## Examples:
    * firstElement(query: app.descendants(matching: .any), identifier: "Featured Playlists-View all")
    * firstElement(query: app.scrollViews.descendants(matching: .any), id: "leftAlignedIconButton", type: .button)
    * - Parameter type: .other (UIView), .cell (UICollectionViewCell or UITableViewCell), .button (UIButton)
    * - Parameter id: The accessibility identifier
    * - Parameter query: The query to target
    */
    public static func firstElement(query: XCUIElementQuery, id: String, type: XCUIElement.ElementType = .any) -> XCUIElement {
      return query.element(matching: type, identifier: id).firstMatch
   }
   /**
    * Returns element of ElementType
    * - Parameter type: .button, .scrollBar, .checkButton etc
    * - Parameter query: The query to target
    * ## Example:
    * app.element(query: app.children, type: .button) //
    */
   public static func firstElement(query: XCUIElementQuery, type: XCUIElement.ElementType) -> XCUIElement {
      return query.children(matching: type).element
   }
   /**
    * Beta warn
    * ## Example:
    * let firstElement = app.firstElement(query: app.children, labels: ["Sugar", "500 g"]).first?.element
    * firstElement.tap()
    * - Parameter query: The query to target
    * - Parameter labels: labels to search for
    */
   public static func firstElement(query: XCUIElementQuery, labels: [String]) -> XCUIElement? {
      return labels.map { label in
         query.containing(NSPredicate(format: "label CONTAINS %@", label))
      }.compactMap { $0 }.first?.element
   }
   /**
    * Find the first match that has a lable
    * ## Examples:
    * firstElement(app.descendants().buttons, label: "Edit list").tap(waitForExistance: 5)
    * - Parameter query: The query to target
    * - Parameter label: label to search for
    */
   public static func firstElement(_ query: XCUIElementQuery, label: String) -> XCUIElement {
      return query.containing(NSPredicate(format: "label CONTAINS %@", label)).firstMatch
   }
   /**
    * Returns elements in query
    * - Parameter query: the search query to match parent element
    * - Parameter type: Filter against a speccific type to get a more presice result
    * - Important: ⚠️️ you can use the native: .allElementsBoundByIndex, there is also one for only items with accessibility
    * - Important: ⚠️️ you can use the native: XCUIApplication.init().children(matching: .button) instead of this method
    * ## Example:
    * QueryParser.elements(query: app.children, type: .button)
    */
   public static func elements(query: XCUIElementQuery, type: XCUIElement.ElementType = .any) -> [XCUIElement] {
      return (0..<query.count).indices.map { i in
         query.children(matching: type).element(boundBy: i) // bound by is a way to access element by index
      }
   }
   /**
    * Find element that has either of the labels provided in strings parameter
    * - Parameter query: The query to target
    * - Parameter strings: the strings to match against
    * - Parameter type: Filter against a speccific type
    * ## Examples:
    * let app = XCUIApplication()
    * let element: AppParser.filterElements(query: app.children, strings: ["Sugar", "500 g"], type: .any).element
    * element.exists // true , false
    * element.first.tap()
    * // Cell example
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
//   public static func firstElement(query: XCUIElementQuery, identifier: String, type: XCUIElement.ElementType = .any) -> XCUIElement? {
//      let elements: [XCUIElement] = QueryParser.elements(query: query, type: type)
//      return elements.first { $0.identifier == identifier }
//   }
