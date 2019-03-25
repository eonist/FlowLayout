import Foundation

/**
 * Getter
 */
extension PrimaryCell{
   override class var id:String {return "\(PrimaryCell.self)"}/*Used for dequeing cells*/
   var primaryCellData:PrimaryCellData? {return data as? PrimaryCellData}
   override var count: Int {return primaryCellData?.thumbURLS.count ?? 0}
}
