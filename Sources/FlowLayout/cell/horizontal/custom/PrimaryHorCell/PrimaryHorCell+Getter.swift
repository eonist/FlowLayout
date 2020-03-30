import Foundation
/**
 * Getter
 */
extension PrimaryHorCell {
   override class var id: String { "\(PrimaryHorCell.self)" } // Used for dequeing cells
   var primaryCellData: PrimaryCellData? { data as? PrimaryCellData }
   override var count: Int { primaryCellData?.thumbURLS.count ?? 0 }
}
