import UIKit

class MainVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView()
        view.backgroundColor = .orange
    }
}
class MainView: UIView { }
