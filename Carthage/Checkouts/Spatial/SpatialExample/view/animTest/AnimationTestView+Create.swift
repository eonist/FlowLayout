import UIKit
import Spatial

extension AnimationTest {
   /**
    * Button
    */
   func createButton() -> Button {
      let btn: Button = .init (type: .system)
      btn.backgroundColor = .gray
      btn.setTitle("Button", for: .normal)
      btn.setTitleColor(.black, for: .normal)
      btn.titleLabel?.textAlignment = .center
      btn.titleLabel?.font =  .systemFont(ofSize: 12)
      // btn.frame = CGRect(x:100, y:50, width:100, height:50)
      btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
      self.addSubview(btn)
      btn.applyAnchorAndSize { view in
         let anchor = Constraint.anchor(view, to: self, align: .centerCenter, alignTo: .centerCenter)
         let size = Constraint.size(view, size: .init(width: 100, height: 48))
         return (anchor, size)
      }
      return btn
   }
   @objc func buttonTouched(sender: UIButton) {
      Swift.print("It Works!!!")
      //      let to:CGFloat = 0//(UIScreen.main.bounds.height/2) + (button.frame.height/2)
      button.animate(to: .zero, align: .topLeft, alignTo: .topLeft) {}
   }
}
/**
 * Button that has ConstraintKind applied
 */
class Button: UIButton, ConstraintKind {
   var anchor: AnchorConstraint?
   var size: SizeConstraint?
}
