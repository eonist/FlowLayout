# Iterator

This iterator class can be used for iterating simple arrays, or handle async local / remote services. 

### How does it work
- Async iteration
- Supports forward and backward iteration
- Works on regular Arrays etc

### How do I get it
- Carthage `github "eonist/Iterator"`
- Manual Open `.xcodeproj`
- CocoaPod (Coming soon)

### Basic Example:
```swift
let arrIterator = ArrayIterator(array: [1,2,3,4,5])
while arrIterator.hasNext() { Swift.print(arrIterator.next()) }//1,2,3,4,5
```

### Async Example:
Here is an example where the iterator is used to iterate a simulated remote service.
```swift
/**
 * Demonstrates async iterator
 */
class DemoIterator: ArrayIterator<DemoItem> {
    var complete: Completed
    init(array: Array<T>, onComplete:@escaping Completed) {
        self.complete = onComplete
        super.init(array: array)
    }
}
/**
 * Extension
 */
extension DemoIterator {
    typealias Completed = () -> Void
    func iterate(callBack:@escaping (_ item: DemoItem, _ success: Bool) -> Void){
        Swift.print("iterate")
        if hasNext() {
            let item: DemoItem = next()
            DispatchQueue.global(qos: .background).async {
                sleep(2)/*Simulates some remote service taking 2.0 sec*/
                let eitherOr: Bool = arc4random_uniform(2) == 0/*heads or tails*/
                Swift.print("Doing some work 💪, success: \(eitherOr ? "✅" : "🚫")")
                callBack(item, eitherOr)
            }
        } else {
            complete()
        }
    }
}
struct DemoItem{}

/**
 * ## Examples:
 * DemoIteratorExample().iterate() //All done: 🎉 2
 */
public class DemoIteratorExample {
   var validItems: [DemoItem] = []
   lazy var arrIterator: DemoIterator = DemoIterator(array: [DemoItem(), DemoItem(), DemoItem()]) {
      print("All done: 🎉 \(self.validItems.count)")// the result varies between a count of 0 and 3
   }
   public init() { /* Do nothing */ }
   public func iterate() {
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
```

### Todo:
- Add the new native swift result type
