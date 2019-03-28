import Foundation
/**
 * Type
 */
extension Button{
   /*Closure signatures*/
   public typealias UpInsideCallBack = () -> Void
   public typealias UpOutsideCallBack = () -> Void
   public typealias DownCallBack = () -> Void
   public typealias UpCallBack = () -> Void
   /*Style*/
   public typealias Style = (backgroundColor:UIColor,borderColor:UIColor,borderWidth:CGFloat,isRounded:Bool)
}

