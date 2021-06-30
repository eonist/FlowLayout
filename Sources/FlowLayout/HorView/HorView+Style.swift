import UIKit
/**
 * Type
 * - Fixme: ⚠️️ maybe move into own HorStyle scope?
 */
extension HorView {
   typealias Style = (header: HeaderStyle, backgroundColor: UIColor, slider: SliderStyle, horCollectionViewBackgroundColor: UIColor)
   typealias HeaderStyle = (backgroundColor: UIColor, title: HeaderTitleStyle, button: HeaderButtonStyle)
   typealias HeaderTitleStyle = (color: UIColor, font: UIFont)
   typealias HeaderButtonStyle = (selectedFontColor: UIColor, unSelectedFontColor: UIColor, selectedFont: UIFont, unSelectedFont: UIFont)
   typealias SliderStyle = (backgroundColor: UIColor, foregroundColor: UIColor)
}
/**
 * Constant
 */
extension HorView {
   static let style: Style = (headerStyle, .blue, sliderStyle, .lightGray)
   private static let headerStyle: HeaderStyle = (.blue, headerTitleStyle, headerButtonStyle)
   private static let headerTitleStyle: HeaderTitleStyle = (.white, .systemFont(ofSize: 22))
   private static let headerButtonStyle: HeaderButtonStyle = (.white, .black, .boldSystemFont(ofSize: 16), .systemFont(ofSize: 16))
   private static let sliderStyle: SliderStyle = (.blue, .white)
}
