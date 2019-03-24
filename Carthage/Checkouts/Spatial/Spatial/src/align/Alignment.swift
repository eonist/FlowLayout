import Foundation
/**
 * Alignment types (Both axises)
 * - TODO: ⚠️️ Add none?
 * - TODO: ⚠️️ Make own Carthage framework named Align? 🤔
 * - Note: use Alignment.topLeft.rawValue if you want to get the string "topLeft"
 */
public enum Alignment:String { 
    case topLeft
    case topCenter
    case topRight
    case bottomLeft
    case bottomCenter
    case bottomRight
    case centerLeft
    case centerRight
    case centerCenter
}
