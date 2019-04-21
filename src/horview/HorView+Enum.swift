import Foundation
/**
 * - TODO: ⚠️️ maybe move to it's own enum file?
 */
extension HorView{
   /**
    * CellType
    */
   enum CellType: String, CaseIterable{
      case primary = "Primary", secondary = "Secondary", tertiary = "Tertiary"
      static let types: [CellType] = [.primary,.secondary,.tertiary]
   }
}
/**
 * Getter
 */
extension HorView.CellType{
   var idx:Int{
      switch self {
      case .primary:
         return 0
      case .secondary:
         return 1
      case .tertiary:
         return 2
      }
   }
}
