import Foundation
/**
 * ## EXAMPLES:
 * var arrIterator = ArrayIterator(array:[1,2,3,4,5])
 * while arrIterator.hasNext() {Swift.print(arrIterator.next())}//1,2,3,4,5
 * - Fixme: ⚠️️ make the ReverseArrayIterator...see notes
 */
open class ArrayIterator<T> {
   var index: Int = 0
   public var collection: [T]
   public init(array: [T]) {
      self.collection = array
   }
   public func hasNext() -> Bool {
      return index < collection.count
   }
   /**
    * Returns current item
    */
   public func next() -> T {
      let retVal = collection[index] // cur item
      index += 1
      return retVal
   }
   public func reset() {
      index = 0
   }
}
extension ArrayIterator: Iteratable {}

//let arrIterator = ArrayIterator(array:[1,2,3,4,5])
//        while arrIterator.hasNext() {
//            Swift.print(arrIterator.next())
//        }
