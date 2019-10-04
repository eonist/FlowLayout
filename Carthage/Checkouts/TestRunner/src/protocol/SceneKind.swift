import Foundation

public protocol SceneKind {
    var sceneRunner: SceneRunnerKind { get }
    func run()
    init(sceneRunner: SceneRunnerKind)
}
