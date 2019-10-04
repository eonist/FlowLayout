import UIKit
import Spatial
import FlowLayout_iOS
import With
/**
 * Create
 */
extension ViewController {
   /**
    * Create the FlowView
    */
   func createFlowView() -> HorView {
      return with(.init()) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
   /**
    * Create custom flow view
    */
   func createCustomFlowView() -> CustomView {
      return with(.init()) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
}
