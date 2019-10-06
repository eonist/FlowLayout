import Foundation
/**
 * Actions
 */
extension RefreshControl {
   /**
    * Begin
    */
   public func beginRefreshing() {
      if isRefreshing == false {
         //         Swift.print("beginRefreshing false \(isRefreshing)")
         isRefreshing = true
         beganRefreshing()
      }
   }
   /**
    * End
    */
   public func endRefreshing() {
      if isRefreshing == true {
         //         Swift.print("endRefreshing() isRefreshing: \(isRefreshing)")
         isRefreshing = false
         endedRefreshing()
      }
   }
}
