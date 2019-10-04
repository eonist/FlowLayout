import Foundation
///
/// ## Examples:
/// extension CustomCell: ReusableCellKind {} // make your subclass conform to the protocol
///
public protocol ReusableCellKind: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
