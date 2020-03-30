import Foundation
/**
 * - Fixme: ⚠️️ maybe move to it's own enum file?
 */
extension HorView {
   /**
    * CellType
    */
   enum CellType: String, CaseIterable {
      case primary, secondary, tertiary
   }
}
/**
 * Getter
 */
extension HorView.CellType {
   var idx: Int? { HorView.CellType.allCases.firstIndex(of: self) }
}
