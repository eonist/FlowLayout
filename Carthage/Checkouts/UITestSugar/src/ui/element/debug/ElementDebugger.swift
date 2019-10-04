import Foundation
import XCTest
/**
 * Debugger
 * - Fixme: ⚠️️ Make debugStr, debugHeirarchyStr that returns string, and actual, debug calls that prints the debug string etc
 */
public class ElementDebugger {
   /**
    * Debug query (can target children or desendants)
    * - Abstract: Helps identify elements (Useful when there is localization involved)
    * ## Examples:
    * debug(query: app.scrollViews.otherElements.buttons)
    * debug(query: app.children)
    * debug(query: app.desendants)
    * - Note: to debug descendants use the descendants call in the query
    * - Parameter query: Debug all elements of this query
    */
   public static func debug(query: XCUIElementQuery) -> String {
      let elements: [XCUIElement] = query.allElementsBoundByIndex
      return elements.map { debug(element: $0) }.joined(separator: "\n")
   }
   /**
    * Helps debug an element
    * - Remark: there is also the native: albumArtwork.debugDescription
    * - Parameter element: The element to debug
    * - Parameter indentation: Used to indent the print, so debugging hierarchy becomes more readable
    * - Returns:
    *  - id: acceccibilityIdentifier
    *  - aLabel: accessibilityLabel
    *  - label: the button.label.text
    *  - type: the XCUIElement type
    *  - title: ?
    * ## Examples:
    * Swift.print(debug(element: app)) // id, label, type, title
    */
   public static func debug(element: XCUIElement, indentation: String = "") -> String {
      let id = element.identifier
      let aLable = String(describing: element.accessibilityLabel)
      let lable = element.label
      let type = element.elementType.string
      let title = element.title
      let str = "\(indentation)identifier:  \(id) accessibilityLabel:  \(aLable) label:  \(lable) type:  \(type) title:  \(title)"
      return str
   }
   /**
    * debug multiple elements (⚠️️ New ⚠️️)
    * ## Examples:
    * let ancestry = ElementParser.ancestry(root: (0, app), condition: { $0.label == "Edit list" })
    * let elements: [XCUIElement] = ancestry?.map { $0.1 }
    * let debugStr: String = elements.debug()
    * Swift.print(debugStr)
    */
   public static func debug(elements: [XCUIElement]) -> String {
      let strings: [String] = elements.map { ElementDebugger.debug(element: $0) }
      let str = strings.joined(separator: "\n")
      return str.suffix(2) == "\n" ? String(str.dropLast(2)) : str // removes the end linebreak \n
   }
   /**
    * Helps debug a hierarchy
    * ## Examples:
    * let hierarchyStr: String = ElementDebugger.debugHierarchy(element: app, type: .any, indentationLevel: 1)
    * Swift.print("Hierarchy: \n" + hierarchyStr)
    * - Important: ⚠️️ remember you also have the Acceccibility dialog in xcode where you can click an element and get hierarchy and info about it etc
    * - Remark: logs can get messy with UITesting, a way to see the hierarchy more clearly is to use the filter filed and filter for the "-" char
    * - Fixme: ⚠️️ ⚠️️ ⚠️️ Instead of printing directly, rather return a string that can be printed, because UITesting is so messy for the log
    * - Fixme: ⚠️️ There is too much linebreaks in the output, clean it up
    * - Parameter element: The root element of the hierarchy
    * - Parameter type: the element type to drill down against. More speccific means less wasted CPU
    * - Parameter indentationLevel: This is used to make the log read more like a hierachy. The more indentation the further down in the hierarchy the item is
    */
   public static func debugHierarchy(element: XCUIElement, type: XCUIElement.ElementType = .any, indentationLevel: Int = 1) -> String {
      let children: [XCUIElement] = element.children(matching: type).allElementsBoundByIndex
      let str: String = children.map {
         let indentationLevel: Int = indentationLevel + 1
         let identation: String = .init(repeating: "-", count: indentationLevel)
         let retVal1: String = debug(element: $0, indentation: identation)
         let retVal2: String = debugHierarchy(element: $0, type: type, indentationLevel: indentationLevel) // keep traversing down the hierarchy
         return retVal1 + (retVal2.isEmpty ? "" : "\n" + retVal2) //if retval2 is empty, don't append it
      }.joined(separator: "\n") // if there are items, then seperate them with a line-break
      return str.suffix(2) == "\n" ? String(str.dropLast(2)) : str // remove the end \n
   }
}
/**
 * Extension
 */
extension Array where Element: XCUIElement {
   public func debug() -> String {
      return ElementDebugger.debug(elements: self)
   }
}
