import UIKit
import Spatial
import With
/**
 * Create
 */
extension ViewController {
   /**
    * Creates the FlowView
    */
   func createFlowView() -> HorView {
      with(.init()) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
   /**
    * Creates custom flow view
    */
   func createCustomFlowView() -> CustomView {
      with(.init()) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
}
