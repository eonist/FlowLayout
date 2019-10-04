import Foundation
import IteratorIOS
import XCTest
/**
 * - Abstract: SceneRunner plays through scenes like a playlist
 * ## Examples:
 * SceneRunner(scenes: [LoginScene.self, LogoutScene.self],  user: ("John", "abc123")) { Swift.print("All scenes completed 🏁") }.iterate(callBack: { _,_  in })
 */
open class SceneRunner: ArrayIterator<SceneKind.Type>, SceneRunnerKind {
   public lazy var app: XCUIApplication = createXCUIApp() // Convenient accessor to the app
   public let user: User // Stores userName and password
   public var scenes: [SceneKind.Type] { return collection } // stores the scenes in the sequence
   public var complete: Completed // A callback that notifies the user when the sequence has completed
   /**
    * Initiate the scene-runner
    * - Parameter sequence: An array of scenes (to be played out)
    * - Parameter onComplete: A callback that notifies the user when the sequence has completed
    */
   @discardableResult
   public init(sequence: [SceneKind.Type], user: User, onComplete:@escaping Completed) {
      self.user = user
      self.complete = onComplete
      super.init(array: sequence)
   }
}
