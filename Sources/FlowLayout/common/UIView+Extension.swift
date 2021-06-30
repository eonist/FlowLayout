import UIKit
/**
 * Controller related
 */
extension UIView {
   /**
    * Easily get Controller
    * - Fixme: ⚠️️ add more doc
    */
   internal func controller() -> UIViewController? {
      if let nextViewControllerResponder = next as? UIViewController {
         return nextViewControllerResponder
      } else if let nextViewResponder = next as? UIView {
         return nextViewResponder.controller()
      } else {
         return nil
      }
   }
   /**
    * Easily get navController from
    * - Fixme: ⚠️️ add more doc
    */
   internal func navigationController() -> UINavigationController? {
      guard let controller = controller() else { return nil }
      return controller.navigationController
   }
}
