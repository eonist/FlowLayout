import Foundation
/**
 * Extension
 */
extension Alignment {
   /**
    * - Returns the horizontal type from the dual-axis type `Alignment`
    */
   public var horAlign: HorizontalAlign {
      switch self {
      case .topLeft, .centerLeft, .bottomLeft: return .left
      case .topRight, .bottomRight, .centerRight: return .right
      case .bottomCenter, .topCenter, .centerCenter: return .centerX
      }
   }
   /**
    * - Returns the vertical type from the dual-axis type `Alignment`
    */
   public var verAlign: VerticalAlign {
      switch self {
      case .topRight, .topCenter, .topLeft: return .top
      case .bottomCenter, .bottomRight, .bottomLeft: return .bottom
      case .centerRight, .centerLeft, .centerCenter: return .centerY
      }
   }
}
