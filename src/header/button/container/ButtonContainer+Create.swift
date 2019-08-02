import UIKit
import With
import Spatial
/**
 * Create
 */
extension ButtonContainer {
   /**
    * Creates buttons
    */
   func createButtons() -> [HeaderButton] {
      let titles: [String] = HorView.CellType.types.map { $0.rawValue }
      let buttons: [HeaderButton] = titles.map { title in // All vertically centered, 30p height each
         with(.init(title: title)) {
            $0.addTarget(self, action: #selector(onTouchInside), for: .touchUpInside)
            self.addSubview($0)
         }
      }
      let widthMultiplier: CGFloat = 1 / CGFloat(titles.count) // 75p on iphone 8
      buttons.distributeAndSize(dir: .hor, height: ButtonContainer.height, align: .topLeft, alignTo: .topLeft, multiplier: .init(width: widthMultiplier, height: 1))
      buttons.first?.setTitleColor(HorView.style.header.button.selectedFontColor, for: .normal)
      buttons.first?.titleLabel?.font = HorView.style.header.button.selectedFont
      return buttons
   }
}
