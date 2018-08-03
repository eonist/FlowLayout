import UIKit

//create an activateConstraint with where clause ✅
class SliderBar:UIView,ConstraintKind{
    var size:SizeConstraint?
    var anchor:AnchorConstraint?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
