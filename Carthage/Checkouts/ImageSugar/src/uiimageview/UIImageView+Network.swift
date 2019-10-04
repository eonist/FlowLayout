import UIKit

 extension UIImageView {
   /**
    * Simplifies loading an image from a weburl to uiimageview
    */
   public convenience init(webPath: String, useBGThread: Bool = true, onError:@escaping OnError = defaultErrorHandler) {
      self.init()
      setImage(webPath: webPath, useBGThread: useBGThread)
   }
   /**
    * Create UIIMageView from filePath
    */
   public convenience init(filePath: String) {//should throw?
      let img = UIImage(contentsOfFile: filePath)
      self.init(image: img)
   }
   /**
    * Sets image async
    */
   public func setImage(webPath: String, useBGThread: Bool = true, onError:@escaping OnError = defaultErrorHandler) {
      let thread: DispatchQueue = (useBGThread ? .global(qos: .background) : .main)//create bg or main thread
      thread.async {
         UIImage.image(webPath: webPath) { (image: UIImage?, error: UIImage.IMGError?) in
            if let img = image {
               DispatchQueue.main.async {//UI stuff must happen on the main thread
                  self.image = img//set the image
               }
            } else {
               onError(error)//call the error handler
            }
         }
      }
   }
}
