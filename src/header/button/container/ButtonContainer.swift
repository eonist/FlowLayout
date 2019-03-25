import UIKit
import With
import Spatial
/**
 * Header
 * TODO: Use Spatial distribute method instead of stackView
 */
class ButtonContainer:UIStackView {
   static let height:CGFloat = 60
   lazy var buttons:[HeaderButton] = self.createButtons()
   override init(frame: CGRect) {
      super.init(frame: frame)
      let bg:UIView = .init()
      bg.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//      bg.backgroundColor = .yellow//debug I suppose
      self.addSubview(bg)/*Add a background to*/
      self.axis = .horizontal/*arrange subViews horizontally*/
      self.distribution  = .equalSpacing
      self.alignment = .center
      self.spacing = 0/*zero gaps between view*/
      _ = buttons
   }
   required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension ButtonContainer {
   /**
    * Creates buttons
    */
   func createButtons() -> [HeaderButton]{
      let titles:[String] = HorView.CellType.types.map{$0.rawValue}
      let boxW:CGFloat = UIScreen.main.bounds.size.width / CGFloat(titles.count) /*75p on iphone 8*/
      let buttons:[HeaderButton] = titles.map{ title in/*All vertically centered, 30p height each*/
         return with(.init(title: title)) {
            //button.backgroundColor = UIColorParser.random
            $0.addTarget(self, action: #selector(onTouchInside), for: .touchUpInside)
            self.addArrangedSubview($0)
            $0.size( width: boxW, height: ButtonContainer.height)
         }
      }
      buttons.first?.setTitleColor(HorView.style.header.button.selectedFontColor, for: .normal)
      buttons.first?.titleLabel?.font = HorView.style.header.button.selectedFont
      return buttons
   }
}
