import Foundation
import XCTest

extension SceneKind {
   public var app: XCUIApplication { return sceneRunner.app }
   public var user: SceneRunner.User { return sceneRunner.user }
}
