import Foundation
import XCTest

extension XCUIElement.ElementType {
   /**
    * Helps identify ElementType (some bug in apples code prevents this with regular String(describing:))
    * - Remark: label is .staticText 🤷
    */
   enum ElementTypeName: String, CaseIterable {
      case any, other, application, group, window, sheet, drawer, alert, dialog, button, radioButton
      case radioGroup, checkBox, disclosureTriangle, popUpButton, comboBox, menuButton, toolbarButton
      case popover, keyboard, key, navigationBar, tabBar, tabGroup, toolbar, statusBar, table, tableRow
      case tableColumn, outline, outlineRow, browser, collectionView, slider, pageIndicator, progressIndicator
      case activityIndicator, segmentedControl, picker, pickerWheel, `switch`, toggle, link, image, icon, searchField
      case scrollView, scrollBar, staticText, textField, secureTextField, datePicker, textView, menu, menuItem, menuBar
      case menuBarItem, map, webView, incrementArrow, decrementArrow, timeline, ratingIndicator, valueIndicator, splitGroup
      case splitter, relevanceIndicator, colorWell, helpTag, matte, dockItem, ruler, rulerMarker, grid, levelIndicator
      case cell, layoutArea, layoutItem, handle, stepper, tab, touchBar, statusItem
   }
}
extension XCUIElement.ElementType {
   /**
    * Returns a human readable representation of what kind of elementType the element is
    * - Remark: Sometimes this is the only way to figure out what an element is
    * ## Examples:
    * app.buttons.firstMatch.elementType.string // button
    */
   public var string: String {
      return ElementTypeName.allCases[Int(self.rawValue)].rawValue
   }
}
