import Foundation
import XCTest
/**
 * Pickerwheel
 */
extension ElementModifier {
   /**
    * Pick a value in pickerWheel
    * - Parameter pickerWheel: The pickerwheel to use
    * - Parameter value: The value guess
    * ## Examples:
    * pick(pickerWheel: app.pickerWheels.element, value: "Picker Wheel Item Title")
    * pick(pickerWheel: ElementParser.firstElement(query:  app.pickerWheels, identifier: "first picker", type:.picker), value: "Picker Wheel Item Title")
    */
   public static func pick(pickerWheel: XCUIElement, value: String) {
      pickerWheel.adjust(toPickerWheelValue: value)
   }
}
