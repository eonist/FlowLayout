import UIKit

internal class UIColorParser {
   /**
    * Returns random color
    * ## Examples: self.backgroundColor = UIColorParser.random
    */
   static var random: UIColor {
      let r: CGFloat = .random(in: (0..<255.0)) / 255.0
      let g: CGFloat = .random(in: (0..<255.0)) / 255.0
      let b: CGFloat = .random(in: (0..<255.0)) / 255.0
      let uiColor: UIColor = .init(red: r, green: g, blue: b, alpha: 1)
      return uiColor
   }
}
