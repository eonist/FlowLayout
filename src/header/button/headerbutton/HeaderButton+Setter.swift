import Foundation
/**
 * Setter
 */
extension HeaderButton{
   /**
    * Sets the button to active mode
    */
   func setActive(isActive:Bool){
      if isActive {
         self.setTitleColor(HorView.style.header.button.selectedFontColor, for: .normal)//.white
         self.titleLabel?.font = HorView.style.header.button.selectedFont//.boldSystemFont(ofSize: 16)
      }else {
         self.titleLabel?.font = HorView.style.header.button.unSelectedFont//.systemFont(ofSize: 16)//.boldSystemFont(ofSize: 14)//
         self.setTitleColor(HorView.style.header.button.unSelectedFontColor, for: .normal)//.black
      }
   }
}
