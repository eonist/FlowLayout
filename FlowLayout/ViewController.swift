import UIKit
/**
 * FlowLayout
 * - Description: FlowLayout (Bi-directional layout framework) (Great for prototyping UX ideas and apps)
 * - Definition: bidirectional: functioning in two directions.
 * - Fixme: ⚠️️ Set the view, don't add to it, also set it as RootVC, like in weather, and reaname to VC 👈
 * - Fixme: ⚠️️ ReUse cell: https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6
 * - Fixme: ⚠️️ Apple video on advance collection views: https://developer.apple.com/videos/play/wwdc2014/232/
 * - Fixme: ⚠️️ mixed sizes in Collection: https://octodev.net/custom-collectionviewlayout/
 */
final class ViewController: UIViewController {
   lazy var flowView: HorView = createCustomFlowView() // createFlowView()
}
/**
 * Overrides
 */
extension ViewController {
   override var prefersStatusBarHidden: Bool { true } // hides statusbar
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView()
      view.backgroundColor = .lightGray
      _ = flowView
   }
   /**
    * Set title
    * - Note: I guess this must be set from this method in order for it to work
    */
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      // By using the setNav... method as oppose to the isNav... we get better animation
      self.navigationController?.setNavigationBarHidden(true, animated: true) // self.navigationController?.isNavigationBarHidden = false//
      navigationItem.title = "Main" // - Fixme: ⚠️️ use enum?
   }
}
final class MainView: UIView {}
