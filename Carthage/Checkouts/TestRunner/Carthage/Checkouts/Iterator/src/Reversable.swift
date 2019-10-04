import Foundation
/**
 * - Fixme: ⚠️️ alt name could be ReverseIteratable 👈  next
 */
protocol Reversable: Iteratable {
    func hasPrev() -> Bool
    func prev() -> T
}
