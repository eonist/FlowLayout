import Foundation

extension HorCell {
   open class var defaultReuseIdentifier: String { return String(describing: self) } // fatalError("must be overrideen in subclass")
   static let margin: CGFloat = 32 // Fixme: ⚠️️ move to const
   /*Default callbacks*/
   static let defaultOnItemSelect: OnItemSelect = { indexPath in Swift.print("indexPath: \(indexPath)") }
   static let defaultOnScroll: OnScroll = { _ in Swift.print("HorCell.scroll - no callback attached") }
}
