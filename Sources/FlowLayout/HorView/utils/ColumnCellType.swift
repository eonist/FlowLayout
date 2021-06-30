import Foundation
/**
 * CellType
 * - Fixme: ⚠️️ rename to ColumnCellType
 */
enum ColumnCellType: String, CaseIterable {
   case primary, secondary, tertiary
}
/**
 * Getter
 */
extension ColumnCellType {
   var idx: Int? { ColumnCellType.allCases.firstIndex(of: self) }
}
