import Foundation

extension SceneRunner {
   /**
    * Call this to begin iterating
    * - Abstract: It will keep iterating until all items has been iterated over
    */
   public func iterate() {
      if hasNext() {
         let sceneType: SceneKind.Type = next()
         let scene: SceneKind = sceneType.init(sceneRunner: self)
         run(scene: scene)
         iterate()
      } else {
         complete()
      }
   }
   /**
    * Run a scene
    */
   public func run(scene: SceneKind) {
      scene.run()
   }
}
