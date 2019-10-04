import XCTest

public class QueryHelper {
   /**
    * Returns all descendants of a query that are hittable
    * ## Example:
    * hittableElements(query: app.descendants(matching: .any)).count // n
    * - Parameter query: can be one element, children or descendants
    * - Important: since we use element boundBy it may not work with waiter calls
    */
   public static func hittableElements(query: XCUIElementQuery) -> [XCUIElement] {
      return (0..<query.count).indices.map { i in
         let element = query.children(matching: .other).element(boundBy: i)
         return element.isHittable ? element : nil
      }.compactMap { $0 }
   }
}
