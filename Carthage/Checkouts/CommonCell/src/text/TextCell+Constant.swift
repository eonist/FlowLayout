import UIKit
///
/// Constants
///
extension TextCell {
   open class var defaultReuseIdentifier: String { return "\(TextCell.self)" }
   open class var backgroundColor: UIColor { return .blue }
   open class var cellHeight: CGFloat { return 124 }
}
extension TextCell {
   public enum Margin {
      static let horizontal: CGFloat = 12
      static let horizontalSpaceBetween: CGFloat = 4
      static let vertical: CGFloat = 12
      static let verticalSpaceBetween: CGFloat = 4
   }
}
