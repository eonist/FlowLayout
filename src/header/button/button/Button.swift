
import Spatial

import Foundation
/**
 * ## Examples
 * let btn:Button = .init(frame: .init(x:0,y:0,width:120,height:40))
 * view.addSubview(btn)
 * btn.tapUpInsideCallBack = { Swift.print("🎉") }
 * - TODO: ⚠️️ Style could be StyleKind and then be overriden in subclasses?
 * - Note: ConstraintKind: Makes the component work with bulk autolayout functionality and animation
 */
open class Button:UIView{/*We use HybridView because that is layerbacked in macOS*/
   /*Call-backs*/
   public var upInsideCallBack:UpInsideCallBack = defaultUpInside
   public var upOutsideCallBack:UpOutsideCallBack = defaultUpOutside
   public var downCallBack:DownCallBack = defaultDown
   public var upCallBack:UpCallBack = defaultUp
   /*Style*/
   internal var style:Style {/*backgroundColor,borderColor,textColor*/
      didSet{
         self.layer.borderColor = style.borderColor.cgColor
         self.layer.backgroundColor = style.backgroundColor.cgColor
         self.layer.borderWidth = style.borderWidth
      }
   }
   /**
    * Initiate
    * - Note: Setting raster ref: https://stackoverflow.com/questions/24316705/how-to-draw-a-smooth-circle-with-cashapelayer-and-uibezierpath
    */
   public init(style:Style = Button.defaultStyle, frame: CGRect = .zero) {
      self.style = style
      super.init(frame:frame)
      _ = {self.style = self.style}()/*updates style, a trick to update didSet inside init*/
//      self.caLayer?.rasterizationScale = 2.0 * Screen.mainScreenScale
//      self.caLayer?.shouldRasterize = true
   }
   /**
    * Boilerplate
    */
   required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
