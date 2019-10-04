import Foundation
import XCTest
/**
 * Hierarchy parser
 */
extension ElementParser {
   /**
    * Returns an array of ancestral elements (basically you find the parents of an element all the way to the root) (alt name: heritage)
    * - Parameter condition: a closure that evaluates to true or false
    * - Parameter element: the point to search from
    * ## Example:
    * let condition: ElementParser.MatchCondition = { element in let s = element.screenshot().image.size; Swift.print("s:  \(s)"); return s == size/*element == btn*/} // .screenshot().image.size == size
    * let ancestry: [(Int, XCUIElement)]? = ElementParser.ancestry(root: (0, app), condition: condition)
    * let imgElementParent  = ancestry?.last
    * let indices: [Int] = ancestry!.map { $0.0 }
    * let elements: [XCUIElement] = ancestry!.map { $0.1 }
    * let descendant: XCUIElement? = ElementParser.element(root: app, index: indices)
    * - Fixme: ⚠️️ Refactor with .map or .flatMap on this method when u have time
    * - Fixme: ⚠️️ You can also use elementAtIndex and element.count
    */
   public static func ancestry(root: (index: Int, element: XCUIElement), condition: MatchCondition) -> [(Int, XCUIElement)]? {
      var collector: [(Int, XCUIElement)]?
      let children: [XCUIElement] = root.element.children(matching: .any).allElementsBoundByIndex
      for (i, child) in children.enumerated() {
         let metCondition: Bool = condition(child)
         if metCondition {
            collector = [(i, child)] // found the item, we don't include the actual item we are looking for
            break
         } else if let descendants = ancestry(root: (0, child), condition: condition) { // try to traverse the descendants
            collector = [(i, child)] + descendants
            break
         }
      }
      return collector
   }
   /**
    * Returns element in a hierarchy based on a mapIndex
    * - Fixme: Base it on query instead, because it's faster
    * - Fixme: ⚠️️ You can also use elementAtIndex and element.count
    */
   public static func element(root: XCUIElement, index: [Int]) -> XCUIElement? {
      let children: [XCUIElement] = root.children(matching: .any).allElementsBoundByIndex
      if index.isEmpty { return root }/*returns the root*/
      else if index.count == 1 && index[0] < children.count { return children[index[0]] }/* the index is at it's end point, cut of the branch */
      else if index.count > 1 && !children.isEmpty && index[0] < children.count {
//         Swift.print("index.count:  \(index.count)")
//         Swift.print("index:  \(index)")
         let newIndex = Array(index[1..<index.count])
         let child: XCUIElement = children[index[0]]
         return element(root: child, index: newIndex)
      } /* here is where the recursive magic happens */
      return nil
   }
   /**
    * Returns ancestry
    * ## Examples:
    * let ancestry: [XCUIElement?] = ElementParser.ancestry(root: self.app, index: pathToElement)
    * let debugAncestry: String = ElementDebugger.debug(elements: ancestry.compactMap { $0 })
    */
   public static func ancestry(root: XCUIElement, index: [Int]) -> [XCUIElement?] {
      var index = index
      var ancestry: [XCUIElement?] = []
      while !index.isEmpty {
         let element = ElementParser.element(root: root, index: index)
         ancestry.append(element)
         _ = index.popLast()
      }
      return ancestry.reversed()
   }
   /**
    * Fixme: ⚠️️ Since XCUIElement isn't comparable
    */
   public func parent(element: XCUIElement) {
      Swift.print("⚠️️ not in use yet ⚠️️")
   }
}
/**
 * Type for ancestry method
 */
extension ElementParser {
   /**
    * - Remark: doing element == otherElement or element.isEqual(otherElement) usually doesn't work
    */
   public typealias MatchCondition = (_ element: XCUIElement) -> Bool
}

//let imgElement = XCUIApplication().descendants(matching: .image).firstMatch
//let condition: ElementParser.MatchCondition = { element in element.screenshot().image.size == CGSize(width: 200, height: 50)) }
//let ancestry: [XCUIElement]? = ElementParser.ancestry(element: imgElement, condition: condition)
//let ImgElementParent: XCUIElement? = ancestry?.last
