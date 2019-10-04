# UITestSugar
Sugar for UITesting

### How do I get it
- Carthage `github "eonist/UITestSugar"`
- Manual Open `.xcodeproj`
- CocoaPod (Coming soon)

### Example:
```swift
let app = XCUIApplication()
let searchedElement = app.filterElements(containing: "Sugar", "500 g").element
searchedElement.exists // true , false
searchedElement.firstMatch.tap()
```

### Note:
When you make frameworks that import XCTest, you need to add the correct framework search path in build settings see: [https://stackoverflow.com/questions/44665656/creating-a-framework-that-uses-xctest](https://stackoverflow.com/questions/44665656/creating-a-framework-that-uses-xctest)

### Todo:
- Make helper method (reusable routines) for:
	- Press all of the back buttons until there aren’t any
	- Scroll down an entire page length
	- Search down a scroll view until it finds a certain element ✅
	- navigate to some screen that we know exists
