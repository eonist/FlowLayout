import Foundation
/**
 * RefreshControl
 * - Note: helps tableview control custom refresh animation / interaction
 */
open class RefreshControl {
   var beganRefreshing: OnBeganRefreshing = {}
   var endedRefreshing: OnEndedRefreshing = {}
   public internal(set) var isRefreshing: Bool = false
   init(onBeganRefreshing:@escaping OnBeganRefreshing, onEndedRefreshing:@escaping OnEndedRefreshing) {
      self.beganRefreshing = onBeganRefreshing
      self.endedRefreshing = onEndedRefreshing
   }
}
