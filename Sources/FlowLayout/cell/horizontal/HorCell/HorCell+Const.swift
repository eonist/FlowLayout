#if os(iOS)
import Foundation
import QuartzCore

extension HorCell {
   open class var defaultReuseIdentifier: String { String(describing: self) } // fatalError("must be overrideen in subclass")
   static let margin: CGFloat = 32
   // Default callbacks
   static let defaultOnItemSelect: OnItemSelect = { indexPath in Swift.print("indexPath: \(indexPath)") }
   static let defaultOnScroll: OnScroll = { _ in Swift.print("HorCell.scroll - no callback attached") }
}
#endif
