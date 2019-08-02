import UIKit
import Spatial
/**
 * Create
 */
extension MainVC {
   /**
    * Creates main view
    */
   func createMainView() -> MainView {
      let view: MainView = .init()
      self.view.addSubview(view)
      view.anchorAndSize(to: self.view)
      return view
   }
   /**
    * Creates animation test view
    */
   func createAnimTestView() -> AnimationTest {
      let view: AnimationTest = .init(frame: .init(origin: .zero, size: .zero))
      self.view.addSubview(view)
      view.anchorAndSize(to: self.view)
      return view
   }
}
