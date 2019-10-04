import UIKit

class BaseCell: UITableViewCell {
   var data: CellDataKind?/*Stores cellData*/
   /**
    * Init
    */
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.selectionStyle = .none/*disables the selection highlighting*/
   }
   /**
    * NOTE: If you're using Auto Layout, you'll need to subclass your UIView and call roundCorners in the view's layoutSubviews for optimal effect.
    */
   override func layoutSubviews() {
      super.layoutSubviews()
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
