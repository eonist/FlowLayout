import Foundation
/**
 * Single axis type
 * - Note: use .rawValue if you want to get the string "topLeft"
 */
public enum AxisType: String {
   case start /*left, top*/
   case middle /*centerX, centerY*/
   case end /*right, bottom*/
}
