import Foundation
/**
 * Supports fractional timeb(normal sleep only supports integer)
 * ## Examples:
 * sleep(sec: 2.2) // sleeps for 2.2 seconds
 * - Parameter sec: the duration in seconds to sleep
 */
public func sleep(sec: Double) {
    usleep(useconds_t(sec * 1_000_000)) // wait for n secs
}
