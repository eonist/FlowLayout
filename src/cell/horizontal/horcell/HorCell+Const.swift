import Foundation

extension HorCell{
   static let margin:CGFloat = 32//TODO: ⚠️️ move to const
   static let defaultOnItemSelect:OnItemSelect = {indexPath in Swift.print("indexPath: \(indexPath)")}
   static let defaultOnScroll:ScrollCallBack = {_ in Swift.print("HorCell.scroll - no callback attached")}
}
