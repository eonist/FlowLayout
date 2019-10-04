# TestRunner 🏃

Simplifies running UI-tests

### How does it work
- Make scenes you can play and get notified on their completion (async)
- Iterate through scenes in sequences
- Reuse common scenes like login and logout
- Works asynchronously

### How do I get it
- Carthage `github "eonist/TestRunner"`
- Manual Open `.xcodeproj`
- CocoaPod (Coming soon)

### Consept:
- Step - (Usually an anonymous Closure with one interaction logic)
- Scene - (A series of steps)
- Sequence - (A series of scenes)

### Example:
```swift
class SearchScene {
  override run(){
    let searchBar = XTElement.findFirst("SearchBar")
    searchBar.search("Eminem")
    let searchButton = XTElement.findFirst("SearchButton")
    searchButton.tap()
    onComplete()
  }
}
let sequence: [SceneKind.Type] = [LoginScene.self, SearchScene.self, LogoutScene.self]
let runner: SceneRunner = .init(sequence: sequence, user: (username:"John", password:"Little") , onComplete: {})
runner.complete { Swift.print("All scenes completed 🏁") }
runner.iterate() // 🏃
```

### Dependencies:
[https://github.com/eonist/UITestSugar](https://github.com/eonist/UITestSugar) 

### Todo:
- Setup repo ✅
- Add carthage support ✅
- Add AsyncIterator as external dep ✅
- Add example project, use Cartfile.private with Spatial etc 👈
