import UIKit
import Spatial
import With
/**
 * Create
 */
extension InputTextCell {
    /**
     * Title
     */
    func createDescLabel() -> UILabel {
        return with(.init()) {
//            let text = "title"
//            $0.text = "title"
            $0.font = .boldSystemFont(ofSize: 20.0)
            $0.textColor = .black
            $0.textAlignment = .left
            contentView.addSubview($0)
            $0.backgroundColor = UIColor.green.withAlphaComponent(0.5)
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.black.cgColor
//            $0.anchorAndSize(to: self, width: size.width, align: .centerLeft, alignTo: .centerLeft, offset: .init(x:20,y:0) )
            $0.activateConstraints { view in
                let y = Constraint.anchor(view, to: self, align: .centerY, alignTo: .centerY)
                let left = Constraint.anchor(view, to: self, align: .left, alignTo: .left, offset: 20)
                guard let str = (self.data as? LeagueCellData)?.placement else { fatalError("err") }
                let size: CGSize = str.size(withAttributes: [.font: UIFont.boldSystemFont(ofSize: 20.0)])
                Swift.print("str:  \(str)")
                Swift.print("size.width:  \(size.width)")
//                let width:NSLayoutConstraint = Constraint.width(view, width: size.width)
                return [y, left /**/  /*right,height,  ,, */]
            }
//            $0.anchor(to: contentView, align: .centerLeft, alignTo: .centerLeft, offset: .init(x:Margin.horizontal,y:0) )
//            $0.activateConstraints { view in
////                let height:NSLayoutConstraint = Constraint.height(view, to: self)//length(view, to:self, viewAxis: .ver, toAxis: .ver )
//                let y = Constraint.anchor(view, to: self, align: .centerY, alignTo: .centerY)
//                let left = Constraint.anchor(view, to: self, align: .left, alignTo: .left)
////                let right = Constraint.anchor(view, to: self, align: .right, alignTo: .right,offset:-Margin.horizontal)
////                let width:NSLayoutConstraint = Constraint.width(view, width: 80)
//                return [y, left /*right,height,  ,width, */]
//            }
//            $0.sizeToFit()
//            $0.numberOfLines = 0
//            $0.lineBreakMode = .byClipping
//            $0.adjustsFontSizeToFitWidth = true
//            $0.minimumScaleFactor = 0.5
//            $0.font = UIFont.systemFont(ofSize: 15)
//            $0.anchorAndSize(to: self.contentView, width:80, align: .centerLeft, alignTo: .centerLeft, offset: .init(x:Margin.horizontal,y:0)  )
        }
    }
    /**
     * TextField
     */
    func createInputTextField() -> UITextField {
        return with(.init()) {
//            $0.returnKeyType = .done
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .gray
            $0.textAlignment = .right
            $0.tintColor = .blue
            $0.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.green.cgColor
            self.contentView.addSubview($0)
//            $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            $0.activateConstraints { view in
//                let height:NSLayoutConstraint = Constraint.height(view, to: contentView)//length(view, to:self, viewAxis: .ver, toAxis: .ver )
                let y = Constraint.anchor(view, to: contentView, align: .centerY, alignTo: .centerY)
                let left = Constraint.anchor(view, to: descLabel, align: .left, alignTo: .right)
//                view.contentCompressionResistancePriority(for: left)
                left.priority = .init(rawValue: 250)
                let right = Constraint.anchor(view, to: contentView, align: .right, alignTo: .right, offset: -Margin.horizontal)
//                right.priority = UILayoutPriority(rawValue: 250)
                return [y, /*height,*/ left, right]
            }
        }
    }
}
