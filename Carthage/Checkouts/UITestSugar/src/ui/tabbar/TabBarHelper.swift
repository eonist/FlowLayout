import XCTest

public class TabBarHelper {
   /**
    * Returns tabBar buttons based on name of the tabbar.item
    * ## Examples:
    * TabBarHelper.tabButton(tabButtonName: "homeButton").tap()
    * - Note: It could be useful to store names of tabbar ids in an enum like: TabButtonType: String { case homeButton, exploreButton, searchButton, myCollectionButton }
    * - Remark: can also be done: app.descendants(matching: .staticText).allElementsBoundByIndex.first { $0.label == "tabBtn1"}
    * - Remark: Can also be done: app.tabBars.buttons["Favorites"].tap(waitForExistence: 5, waitAfter: 2)
    * - Parameter tabButtonName: same as: acceccebiltyIdentifier
    */
   public static func tabButton(tabButtonName: String) -> XCUIElement {
      return XCUIApplication().firstDescendant(type: .button, id: tabButtonName)
//      return XCUIApplication().descendants(matching: .any).matching(identifier: tabButtonName).element
   }
   /**
    * Returns tabBar buttons based on index of the tabbar.item
    * ## Examples:
    * pubTabBarHelper.tabButton(tabButtonName: 0).tap()lic static func tabButton(idx: Int) -> XCUIElement {
    */
   public static func tabButton(idx: Int) -> XCUIElement {
      let tabBarsQuery = XCUIApplication().tabBars
      let uiElement = tabBarsQuery.buttons.element(boundBy: idx)
      return uiElement
   }
}
