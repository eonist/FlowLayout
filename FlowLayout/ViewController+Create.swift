import UIKit
import Spatial
import With
/**
 * Create
 */
extension ViewController {
   /**
    * Create the FlowView
    */
   func createFlowView() -> HorView {
      with(.init()) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
   /**
    * Create custom flow view
    */
   func createCustomFlowView() -> CustomView {
      with(.init()) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
}
