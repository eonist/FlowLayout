import UIKit
import Spatial

class VC: UIViewController {
   lazy var mainView:MainView = createMainView()
   lazy var animTestView:AnimationTest = createAnimTestView()
   override func viewDidLoad() {
      super.viewDidLoad()
      _ = mainView
      //_ = animTestView
      self.view.backgroundColor = .purple
   }
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
}
