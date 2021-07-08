#if os(iOS)
import UIKit
/**
 * Header
 * - Note: Essentially contains: (title, buttons, slider)
 */
open class Header: UIView {
   lazy var topFix: UIView = self.createTopFix() // to cover up a void space
   lazy var headerTitle: UILabel = self.createHeaderTitle()
   lazy var buttonContainer: ButtonContainer = self.createButtonContainer()
   lazy var slider: Slider = self.createSlider()
   override public init(frame: CGRect = .zero) {
      super.init(frame: frame)
      self.backgroundColor = HorView.style.header.backgroundColor
      _ = createBackgroundFix()
      _ = topFix
      _ = headerTitle
      _ = buttonContainer
      _ = slider
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

#endif
