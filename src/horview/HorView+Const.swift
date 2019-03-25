import Foundation
extension HorView{
   /**
    * CellType
    */
   enum CellType:String,CaseIterable{
      case primary = "PRimary",secondary = "Secondary",tertiary = "Tertiary"
      static let types:[CellType] = [.primary,.secondary,.tertiary]
   }
}
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
