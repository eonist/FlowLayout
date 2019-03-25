import UIKit
/**
 * Type
 */
extension HorView{
   typealias Style = (header:HeaderStyle,backgroundColor:UIColor,slider:SliderStyle,horCollectionViewBackgroundColor:UIColor)
   typealias HeaderStyle = (backgroundColor:UIColor, title:HeaderTitleStyle, button:HeaderButtonStyle)
   typealias HeaderTitleStyle = (color:UIColor,font:UIFont)
   typealias HeaderButtonStyle = (selectedFontColor:UIColor,unSelectedFontColor:UIColor,selectedFont:UIFont,unSelectedFont:UIFont)
   typealias SliderStyle = (backgroundColor:UIColor,foregroundColor:UIColor)
}
/**
 * Const
 */
extension HorView{
   static let style:Style = (headerStyle,.blue,sliderStyle,.lightGray)
   static let headerStyle:HeaderStyle = (.blue,headerTitleStyle,headerButtonStyle)
   static let headerTitleStyle:HeaderTitleStyle = (.white, .systemFont(ofSize: 22))
   static let headerButtonStyle:HeaderButtonStyle = (.white, .black,  .boldSystemFont(ofSize: 16),.systemFont(ofSize: 16))
   static let sliderStyle:SliderStyle = (.blue,.white)
}
