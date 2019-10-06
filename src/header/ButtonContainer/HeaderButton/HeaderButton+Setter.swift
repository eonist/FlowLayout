import Foundation
/**
 * Setter
 */
extension HeaderButton {
   /**
    * Sets the button to active mode
    */
   func setActive(isActive: Bool) {
      if isActive {
         self.setTitleColor(HorView.style.header.button.selectedFontColor, for: .normal)
         self.titleLabel?.font = HorView.style.header.button.selectedFont
      } else {
         self.setTitleColor(HorView.style.header.button.unSelectedFontColor, for: .normal)
         self.titleLabel?.font = HorView.style.header.button.unSelectedFont
      }
   }
}
