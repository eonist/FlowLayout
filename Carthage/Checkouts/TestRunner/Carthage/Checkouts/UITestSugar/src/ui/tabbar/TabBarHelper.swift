import XCTest

public class TabBarHelper {
   ///
   /// Returns tabbar buttons based on name of the tabbar.item
   /// ## Examples:
   /// TabBarHelper.tabButton(tabButtonName: "homeButton").tap()
   /// - Note: It could be useful to store names of tabbar ids in an enum like: TabButtonType: String { case homeButton, exploreButton, searchButton, myCollectionButton }
   ///
   public static func tabButton(tabButtonName: String) -> XCUIElement {
      return XCUIApplication().descendants(matching: .any).matching(identifier: tabButtonName).element
   }
   ///
   /// Returns tabbar buttons based on index of the tabbar.item
   /// ## Examples:
   /// TabBarHelper.tabButton(tabButtonName: 0).tap()
   ///
   public static func tabButton(idx: Int) -> XCUIElement {
      let tabBarsQuery = XCUIApplication().tabBars
      let uiElement = tabBarsQuery.buttons.element(boundBy: idx)
      return uiElement
   }
}
