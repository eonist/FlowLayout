import Foundation
/**
 * Getter
 */
extension PrimaryHorCell{
   override class var id: String {return "\(PrimaryHorCell.self)"}/*Used for dequeing cells*/
   var primaryCellData: PrimaryCellData? {return data as? PrimaryCellData}
   override var count: Int {return primaryCellData?.thumbURLS.count ?? 0}
}
