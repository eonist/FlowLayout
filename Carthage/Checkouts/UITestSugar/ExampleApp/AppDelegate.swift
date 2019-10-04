import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = {
      let win = UIWindow(frame: UIScreen.main.bounds)
      let vc = MainVC()
      win.rootViewController = vc
      win.makeKeyAndVisible()/*Important since we have no Main storyboard anymore*/
      return win
   }()
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      _ = window
      return true
   }
}
/**
 * ViewController
 */
class MainVC: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView()
      view.backgroundColor = .orange
   }
   override var prefersStatusBarHidden: Bool { return true }
}
class MainView: UIView {
   lazy var btn: UIButton = createButton()
   override init(frame: CGRect) {
      super.init(frame: frame)
      _ = btn
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
extension MainView {
   /**
    * Creates button
    */
   func createButton() -> UIButton {
      let btn: UIButton = .init(type: .system)
      btn.backgroundColor = .gray
      btn.setTitle("Button", for: .normal)
      btn.setTitleColor(.black, for: .normal)
      btn.titleLabel?.textAlignment = .center
      btn.titleLabel?.font =  .systemFont(ofSize: 12)
      btn.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
      btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
      btn.accessibilityIdentifier = "theBtn"
      self.addSubview(btn)
      return btn
   }
   @objc func buttonTouched(sender: UIButton) {
      Swift.print("It Works!!!")
   }
}
