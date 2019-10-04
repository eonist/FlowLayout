import Foundation
import IteratorIOS
/**
 * Action
 */
extension DemoIterator {
   /**
    * Async iterate call
    */
   func iterate(callBack:@escaping (_ item: DemoItem, _ success: Bool) -> Void) {
      Swift.print("iterate")
      if hasNext() {
         let item: DemoItem = next()
         DispatchQueue.global(qos: .background).async {
            sleep(2) /* Simulates some remote service taking 2.0 sec */
            let eitherOr: Bool = .random()//Int.random(in: 2)//arc4random_uniform(2) == 0 /*heads or tails*/
            Swift.print("Doing some work 💪, success: \(eitherOr ? "✅" : "🚫")")
            callBack(item, eitherOr)
         }
      } else {
         complete()
      }
   }
}
/**
 * Type
 */
extension DemoIterator {
   typealias Completed = () -> Void
}
