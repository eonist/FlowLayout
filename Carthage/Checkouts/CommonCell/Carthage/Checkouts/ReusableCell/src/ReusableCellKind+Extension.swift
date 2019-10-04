import UIKit

extension ReusableCellKind where Self: UIView {
    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
