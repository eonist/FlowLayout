import Foundation
import IteratorIOS
/**
 * Demonstrates async iterator
 */
class DemoIterator: ArrayIterator<DemoItem> {
    var complete: Completed
    init(array: [DemoItem], onComplete:@escaping Completed) {
        self.complete = onComplete
        super.init(array: array)
    }
}
