import UIKit

/**
 * Move to own class, margins, insets etc
 * TIPS: Access all colors via: Constants.Colors.allCases
 */
class Constants{
   enum Colors:String,CaseIterable{
      case blue = "FB1B4D", yellow = "1DE3E6", red = "22FFA0", green = "FED845"
      var uiColor:UIColor {
         return UIColor.init(hex: self.rawValue)
      }
   }
}
