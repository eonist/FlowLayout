import Foundation
/**
 * - Note: Use .rawValue if you want to get the string "topLeft"
 */
public enum VerticalAlign: String {
   case top
   case bottom
   case centerY /* Use centerY or else .dot syntax fails */
}
