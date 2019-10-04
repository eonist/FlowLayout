import UIKit
class MainVC: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView()
      view.backgroundColor = .orange
   }
   override var prefersStatusBarHidden: Bool { return false }
}
class MainView: UIView { }

//class SearchScene {
//   override run(){
//   let searchBar = XTElement.findFirst("SearchBar")
//   searchBar.search("Eminem")
//   let searchButton = XTElement.findFirst("SearchButton")
//   searchButton.tap()
//   onComplete()
//   }
//}
//let sequence: [SceneKind.Type] = [LoginScene.self, SearchScene.self, LogoutScene.self]
//let runner: SceneRunner = .init(sequence: sequence, user: (username:"John", password:"Little") , onComplete: {})
//runner.complete { Swift.print("All scenes completed 🏁") }
//runner.iterate() // 🏃
