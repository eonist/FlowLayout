import UIKit
/**
 * FlowLayout
 * - Description: FlowLayout (Bi-directional layout framework) (Great for prototyping UX ideas and apps)
 * - Definition: bidirectional: functioning in two directions.
 * - TODO: ⚠️️ set the view, don't add to it, also set it as RootVC, like in weather, and reaname to VC 👈
 * - TODO: ⚠️️ ReUse cell: https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6
 * - TODO: ⚠️️ apple video on advance collection views: https://developer.apple.com/videos/play/wwdc2014/232/
 * - TODO: mixed sizes in Collection: https://octodev.net/custom-collectionviewlayout/
 */
class ViewController: UIViewController {
   lazy var flowView:HorView = createFlowView()
   override func viewDidLoad() {
      super.viewDidLoad()
      _ = flowView
   }
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
}

//Clean up comments 👈
//add with ✅
//Add Spatial ✅
//make it a programmatic APP
//add disable to boilerplate stubs
//Make it carthage compatible
//Make things open and public
//Organize better
//make it subclassable
//Add theme example
//add Prefs button
//add better master / detail framework (see legacy project)
//add correct y-offset between vertical views when toggeling (maybe just force y= 0?)
