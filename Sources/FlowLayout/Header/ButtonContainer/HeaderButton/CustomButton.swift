import UIKit
import Spatial
import With

class CustomButton: UIButton, ConstraintKind {
   // - Fixme: ⚠️️ use anchorAndSize var
   var anchor: (x: NSLayoutConstraint, y: NSLayoutConstraint)?
   var size: (w: NSLayoutConstraint, h: NSLayoutConstraint)?
   init(title: String) {
      super.init(frame: .zero)
      with(self) {
         $0.backgroundColor = .clear
         $0.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
         $0.titleLabel?.textAlignment = .center
         $0.setTitleColor(.black, for: .normal)
         $0.setTitle(title, for: .normal)
      }
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
