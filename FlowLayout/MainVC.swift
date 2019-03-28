import UIKit
import FlowLayout_iOS
/**
 * FlowLayout
 * - Description: FlowLayout (Bi-directional layout framework) (Great for prototyping UX ideas and apps)
 * - Definition: bidirectional: functioning in two directions.
 * - TODO: ⚠️️ set the view, don't add to it, also set it as RootVC, like in weather, and reaname to VC 👈
 * - TODO: ⚠️️ ReUse cell: https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6
 * - TODO: ⚠️️ apple video on advance collection views: https://developer.apple.com/videos/play/wwdc2014/232/
 * - TODO: ⚠️️ mixed sizes in Collection: https://octodev.net/custom-collectionviewlayout/
 */
class MainVC :UIViewController{
   lazy var flowView:HorView = createCustomFlowView()//createFlowView()
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
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
      /*By using the setNav... method as oppose to the isNav... we get better animation*/
      self.navigationController?.setNavigationBarHidden(true, animated: true)//self.navigationController?.isNavigationBarHidden = false//
      navigationItem.title = "Main"
   }
}
class MainView:UIView{}
