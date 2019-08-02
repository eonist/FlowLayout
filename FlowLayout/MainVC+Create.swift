import UIKit
import Spatial
import FlowLayout_iOS
import With
/**
 * Create
 */
extension MainVC {
   /**
    * Create the FlowView
    */
   func createFlowView() -> HorView {
      return with(.init(frame: .zero)) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
   /**
    * Create custom flow view
    */
   func createCustomFlowView() -> CustomView {
      return with(.init(frame: .zero)) {
         view.addSubview($0)
         $0.anchorAndSize(to: view)
      }
   }
}
