import UIKit

/**
 * FlowLayout
 * DESCRIPTION: FlowLayout (Bi-directional layout framework) (Great for prototyping UX ideas and apps)
 * DEFINITION: bidirectional: functioning in two directions.
 * TODO: ⚠️️ set the view, don't add to it, also set it as RootVC, like in weather, and reaname to VC 👈
 * TODO: ⚠️️ ReUse cell: https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6
 * TODO: ⚠️️ apple video on advance collection views: https://developer.apple.com/videos/play/wwdc2014/232/
 */
class ViewController: UIViewController {
    lazy var flowView = createFlowView()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = flowView
    }
    override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
}
