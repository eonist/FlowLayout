import UIKit
/**
 * Header (title,buttons,slider)
 */
open class Header:UIView {
   lazy var topFix:UIView = self.createTopFix()
   lazy var headerTitle:UILabel = self.createHeaderTitle()
   lazy var buttonContainer:ButtonContainer = self.createButtonContainer()
   lazy var slider:Slider = self.createSlider()
   override public init(frame: CGRect) {
      super.init(frame: frame)
      //let bg = UIView()
      //bg.backgroundColor = .red/*debug*/
      self.backgroundColor = HorView.style.header.backgroundColor
      _ = createGraphicFix()//TODO: ⚠️️ rename to backgroundFix
      _ = topFix
      _ = headerTitle
      _ = buttonContainer
      _ = slider
   }
   /**
    * Boilerplate
    */
   required public init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
