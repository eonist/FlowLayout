import UIKit
@UIApplicationMain

final class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = {
      let win = UIWindow(frame: UIScreen.main.bounds)
      let vc = ViewController()
      win.rootViewController = vc
      win.makeKeyAndVisible() // Important: ⚠️️ since we have no Main storyboard because this app uses programatic UI
      return win
   }()
   func applicationDidFinishLaunching(_ application: UIApplication) {
      _ = window
   }
}
