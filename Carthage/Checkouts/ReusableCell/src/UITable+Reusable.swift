import UIKit

extension UITableView {
   ///
   /// ## Examples:
   /// tableView.register(CustomCell.self)
   /// - Fixme: ⚠️️ Add support for registering multiple cells: register([HCell.self,VCell.self]) etc, see TestRunner for similar code for how to do this
   ///
   public func register<T: UITableViewCell>(_: T.Type) where T: ReusableCellKind {
      register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
   }
   ///
   /// Adds support for registering multiple cells: register([HCell.self, VCell.self]) etc
   ///
   public func register<T: UITableViewCell>(_ types: [T.Type]) where T: ReusableCellKind {
      types.forEach { register($0.self, forCellReuseIdentifier: $0.defaultReuseIdentifier) }
   }
   ///
   /// ## Examples:
   /// let cell: CustomCell = collectionView.dequeueReusableCell()
   ///
   public func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReusableCellKind, T: NibLoadableView {
      return dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as! T
   }
}
///
/// Support for Nib
///
extension UITableView {
   public func register<T: UITableViewCell>(_: T.Type) where T: ReusableCellKind, T: NibLoadableView {
      let bundle = Bundle(for: T.self)
      let nib = UINib(nibName: T.nibName, bundle: bundle)
      register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
   }
   public func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReusableCellKind {
      return dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as! T
   }
}
///
/// Adds indexPath support
///
extension UITableView {
   public func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ReusableCellKind {
      return dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
   }
   public func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: ReusableCellKind, T: NibLoadableView {
      return dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
   }
}
