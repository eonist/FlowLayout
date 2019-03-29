import UIKit
import With
import Spatial
/**
 * Header
 * - TODO: ⚠️️ Use Spatial distribute method instead of stackView
 */
class ButtonContainer:UIView {//UIStackView
   static let height:CGFloat = 60
   lazy var buttons:[HeaderButton] = self.createButtons()
   typealias ButtonClick = (_ buttonTitle:String) -> Void
   var onButtonClick:ButtonClick = {_ in Swift.print("Callback is missing")}
   override init(frame: CGRect) {
      super.init(frame: frame)
      let bg:UIView = .init()
//      bg.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      bg.backgroundColor = .green//debug
      self.addSubview(bg)/*Add a background to*/
//      self.axis = .horizontal/*arrange subViews horizontally*/
//      self.distribution  = .equalSpacing
//      self.alignment = .center
//      self.spacing = 0/*zero gaps between view*/
      _ = buttons
   }
   required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

