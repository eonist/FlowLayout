import UIKit

class HeaderButton:UIView{
    lazy var label:UILabel = createLabel()
    var title:String
    init(title:String) {
        self.title = title
        super.init(frame: .zero)
        self.backgroundColor = UIColorParser.random
        _ = label
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderButton{
    /**
     * Create Day Label
     */
    func createLabel() -> UILabel{
        let label = UILabel()//add day label
        label.text = title
        label.font = .boldSystemFont(ofSize: 12)//dayLabel.font.withSize(12)
        label.textAlignment = .center
        //dayLabel.backgroundColor = .yellow
        label.textColor = .black//UIColor(hex:"EBCF4B")
        self.addSubview(label)
        label.activateConstraint{ view in
            let anchor = Constraint.anchor(label, to: self, align:.topCenter, alignTo: .topCenter)
            let height = Constraint.height(label, height: 30)
            let width = Constraint.width(label, to: self)
            return [anchor.x,anchor.y,width,height]
        }
        return label
    }
}
