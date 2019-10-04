import UIKit
import CommonCell

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainVC()
        win.rootViewController = vc
        win.makeKeyAndVisible() // Important since we have no Main storyboard anymore
        return win
    }()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = window
        return true
    }
}
class MainVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        view.backgroundColor = .orange
    }
    override var prefersStatusBarHidden: Bool { return false }
}
class MainView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let data: TextCellData = .init(description: "", content: "")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
