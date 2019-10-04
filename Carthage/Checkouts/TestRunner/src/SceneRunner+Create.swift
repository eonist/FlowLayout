import Foundation
import XCTest

extension SceneRunner {
   @objc open func createXCUIApp() -> XCUIApplication {
      let app = XCUIApplication()
      app.launch()
      return app
   }
}
