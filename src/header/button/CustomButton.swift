import UIKit
import Spatial

class CustomButton:UIButton,ConstraintKind{
    var anchor:(x:NSLayoutConstraint,y:NSLayoutConstraint)?
    var size:(w:NSLayoutConstraint,h:NSLayoutConstraint)?
    init(title:String) {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        self.titleLabel?.textAlignment = .center
        self.setTitleColor(.black, for: .normal)
        self.setTitle(title, for: .normal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
