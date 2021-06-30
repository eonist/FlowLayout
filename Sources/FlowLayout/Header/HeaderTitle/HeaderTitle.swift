import UIKit

final class HeaderTitle: UILabel {
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.font = HorView.style.header.title.font
      self.textAlignment = .center
      self.backgroundColor = .clear
      self.textColor = HorView.style.header.title.color
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
