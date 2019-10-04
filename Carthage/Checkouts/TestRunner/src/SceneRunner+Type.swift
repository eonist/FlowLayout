import Foundation
/**
 * Extension
 */
extension SceneRunner {
    public typealias User = (username: String, password: String) // Stores userName and password
    public typealias Completed = () -> Void // A callback that notifies the user when the sequence has completed
}
