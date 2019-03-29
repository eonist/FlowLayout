import UIKit

/**
 * Controller related
 */
internal extension UIView{
   /**
    * Easily get Controller
    */
   func controller() -> UIViewController? {
      if let nextViewControllerResponder = next as? UIViewController {
         return nextViewControllerResponder
      } else if let nextViewResponder = next as? UIView {
         return nextViewResponder.controller()
      } else  {
         return nil
      }
   }
   /**
    * Easily get navController from
    */
   func navigationController() -> UINavigationController? {
      guard let controller = controller() else { return nil }
      return controller.navigationController
   }
}

