import UIKit

extension UICollectionView {
   ///
   /// ## Examples:
   /// tableView.register(CustomCell.self)
   ///
   public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableCellKind {
      register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
   }
   ///
   /// Adds support for registering multiple cells: register([HCell.self, VCell.self]) etc
   ///
   public func register<T: UICollectionViewCell>(_ types: [T.Type]) where T: ReusableCellKind {
      types.forEach { register($0.self, forCellWithReuseIdentifier: $0.defaultReuseIdentifier) }
   }
}
///
/// Adds indexPath support
///
extension UICollectionView {
   ///
   /// ## Examples:
   /// let cell: CustomCell = collectionView.dequeueReusableCell(.init(row: 0, section: 0))
   ///
   public func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: ReusableCellKind {
      return dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
   }
   public func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: ReusableCellKind, T: NibLoadableView {
      return dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
   }
}
