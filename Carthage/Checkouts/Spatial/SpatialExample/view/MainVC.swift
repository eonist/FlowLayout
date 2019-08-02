import UIKit
import Spatial

class MainVC: UIViewController {
   lazy var mainView: MainView = createMainView()
   lazy var animTestView: AnimationTest = createAnimTestView()
   override func viewDidLoad() {
      super.viewDidLoad()
      _ = mainView
      //_ = animTestView
      self.view.backgroundColor = .lightGray
   }
   override var prefersStatusBarHidden: Bool { return true }/*hides statusbar*/
}
