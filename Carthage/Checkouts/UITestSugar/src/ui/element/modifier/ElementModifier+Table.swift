import Foundation
import XCTest
/**
 * Table
 */
extension ElementModifier {
   /**
    * Pulls a tableview to refresh
    * - Parameter tableElement: The table to pull-refresh
    */
   public static func pullToRefresh(tableElement: XCUIElement) {
      let firstCell: XCUIElement = tableElement.children(matching: .cell).firstMatch
      let start = firstCell.coordinate(withNormalizedOffset: .init(dx: 0, dy: 0))
      let finish = firstCell.coordinate(withNormalizedOffset: .init(dx: 0, dy: 6))
      start.press(forDuration: 0, thenDragTo: finish)
   }
   /**
    * (Untested)
    * - Parameter element: The element to search from
    * - Parameter idx: The index of the cell
    */
   public static func cell(element: XCUIElement, idx: Int) -> XCUIElement {
      return element.tables.cells.element(boundBy: idx)
   }
}
