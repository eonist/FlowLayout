import Foundation
/**
 * TODO: ⚠️️ Upgrade this to caseiteratable
 */
extension HorView{
   enum CellType:String{
      case primary,secondary,tierary
      static let types:[CellType] = [.primary,.secondary,.tierary]
      /**
       * NOTE: Since there is no way to get back an enum value from its hashValue, you have to do it manually.
       */
      static func fromHashValue(hashValue: Int) -> CellType? {
         switch hashValue {
         case 0:
            return .primary
         case 1:
            return .secondary
         case 2:
            return .tierary
         default:
            return nil
         }
      }
      var idx:Int{
         switch self {
         case .primary:
            return 0
         case .secondary:
            return 1
         case .tierary:
            return 2
         }
      }
   }
}
