import Foundation
import IteratorIOS
/**
 * ## Examples:
 * DemoIteratorExample().iterate() //All done: 🎉 2
 */
 class DemoIteratorExample {
   var validItems: [DemoItem] = []
   lazy var arrIterator: DemoIterator = .init(array: [DemoItem(), DemoItem(), DemoItem()]) {
      Swift.print("All done: 🎉 \(self.validItems.count)") // the result varies between a count of 0 and 3
   }
   func iterate() {
      arrIterator.iterate { item, success in
         if success {
            self.validItems.append(item)
            self.iterate()
         } else {
            self.iterate()
         }
      }
   }
}
