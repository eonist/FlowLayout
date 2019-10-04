import UIKit

extension TopBar {
   static let topBarHeight: CGFloat = UIScreen.main.bounds.width / 4 + UIApplication.shared.statusBarFrame.height
}


//_ = buttons
//applyButtonConstraints()

//extension TopBar{
//   /**
//    * Creates Buttons
//    */
//   func createButtons() -> [UIButton] {
//      Swift.print("UIApplication.shared.statusBarFrame.height):  \(UIApplication.shared.statusBarFrame.height))")
//      return (0..<4).indices.map { i in
//         let btn = UIButton.init(frame: .zero)
//         btn.backgroundColor = Constants.Colors.allCases[i].uiColor
//         btn.titleLabel?.font =  .boldSystemFont(ofSize: 16)//.systemFont(ofSize: 12)
//         btn.setTitleColor(.black, for: .normal)
//         btn.titleLabel?.textAlignment = .center
//         btn.setTitle("\(i)", for: .normal)
//         addSubview(btn)
//         return btn
//      }
//   }
//   func applyButtonConstraints(){
//      /*Align first btn*/
//      let btn0 = buttons[0]
//      btn0.activateConstraint { view in
//         let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft, offset:CGPoint(x:0,y:UIApplication.shared.statusBarFrame.height))
//         let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/4))
//         return [anchor.x,anchor.y,size.w,size.h]
//      }
//      /*Align other btns*/
//      (1..<4).indices.forEach{ i in
//         let btn = buttons[i]
//         btn.activateConstraint { view in
//            let prevBtn = buttons[i-1]
//            let anchor = Constraint.anchor(view, to: prevBtn, align: .topLeft, alignTo: .topRight)
//            let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.width/4))
//            return [anchor.x,anchor.y,size.w,size.h]
//         }
//      }
//   }
//}
