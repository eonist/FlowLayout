import UIKit
import With
import Spatial
/**
 * This is the view that has the header buttons (aka primary, secondary, tierary)
 */
class ButtonContainer: UIView {
   static let height: CGFloat = 60
   lazy var buttons: [HeaderButton] = self.createButtons()
   var onButtonClick: OnButtonTap = defaultOnButtonTap
   override init(frame: CGRect) {
      super.init(frame: frame)
      let bg: UIView = .init()
      bg.backgroundColor = .green
      self.addSubview(bg) // Add a background to
      _ = buttons
   }
   /**
    * Boilerplate
    */
   required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
