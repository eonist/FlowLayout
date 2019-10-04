import XCTest

public class QueryHelper {
   /**
    * Returns all descendants of a query that are hittable
    * ## Example:
    * hittableElements(query: app.descendants(matching: .any)).count // n
    */
   public static func hittableElements(query: XCUIElementQuery) -> [XCUIElement] {
      return (0..<query.count).indices.map { i in
         let element = query.children(matching: .other).element(boundBy: i)
         return element.isHittable ? element : nil
      }.compactMap { $0 }
   }
}
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
