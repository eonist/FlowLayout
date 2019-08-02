import UIKit
import With
import Spatial

class MinMaxTestView: UIView {
   lazy var descLabel: UILabel = createDescLabel()
   lazy var inputTextField: UITextField = createInputTextField()
   override init(frame: CGRect = .zero) {
      super.init(frame: frame)
      _ = descLabel
      //        descLabel.text = "Desc"
      _ = inputTextField
      inputTextField.text = "Some details about"
   }
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension MinMaxTestView {
   /**
    * Title
    */
   func createDescLabel() -> UILabel {
      return with(.init()) {
         let text = "Description:"
         $0.text = text
         let font = UIFont.boldSystemFont(ofSize: 20.0)
         $0.font = font
         $0.textColor = .black
         $0.textAlignment = .left
         self.addSubview($0)
         $0.backgroundColor = UIColor.green.withAlphaComponent(0.5)
         $0.layer.borderWidth = 0.5
         $0.layer.borderColor = UIColor.black.cgColor
         //            $0.anchor(to: self, align: .centerLeft, alignTo: .centerLeft, offset: .init(x:20,y:0) )
         $0.activateConstraints { view in
            //let height:NSLayoutConstraint = Constraint.height(view, to: self)//length(view, to:self, viewAxis: .ver, toAxis: .ver )
            let y = Constraint.anchor(view, to: self, align: .centerY, alignTo: .centerY)
            let left = Constraint.anchor(view, to: self, align: .left, alignTo: .left, offset: 20)
            //                let right = Constraint.anchor(view, to: self, align: .right, alignTo: .right, offset:-20)
            //                let stringWidth:CGFloat =
            let size = text.size(withAttributes: [.font: font])
            let width: NSLayoutConstraint = Constraint.width(view, width: size.width)
            return [y, left, width /*,height,,,*/]
         }
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
         $0.font = .systemFont(ofSize: 16)
         $0.textColor = .gray
         $0.textAlignment = .right
         $0.tintColor = .blue
         $0.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
         $0.layer.borderWidth = 0.5
         $0.layer.borderColor = UIColor.green.cgColor
         $0.text = "test content"
         self.self.addSubview($0)
         //$0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         $0.activateConstraints { view in
            //let height:NSLayoutConstraint = Constraint.height(view, to: contentView)//length(view, to:self, viewAxis: .ver, toAxis: .ver )
            let y = Constraint.anchor(view, to: self, align: .centerY, alignTo: .centerY)
            let width = Constraint.width(view, width: 100)
            //let left = Constraint.anchor(view, to: descLabel, align: .left, alignTo: .right/*, relation:.lessThanOrEqual*/)
            //left.priority = .init(rawValue: 900)
            let right = Constraint.anchor(view, to: self, align: .right, alignTo: .right, offset: -20)
            //right.priority = UILayoutPriority(rawValue: 1000)
            return [y, /*height,, left*/ right, width]
         }
      }
   }
}
