import UIKit
import Spatial
import With
/**
 * Create
 */
extension Header {
   /**
    * TODO: ⚠️️ Make the headerTitle it's own class
    */
   func createHeaderTitle() -> UILabel{
      return with(.init()){
         $0.text = HorView.CellType.primary.rawValue
         $0.font = $0.font.withSize(22)
         $0.textAlignment = .center
         $0.backgroundColor = .blue
         $0.textColor = .white//UIColor(hex:"EBCF4B")
         self.addSubview($0)
         $0.activateConstraints{ label in
            let anchor = Constraint.anchor(label, to: self, align:.topLeft, alignTo: .topLeft)
            let height = Constraint.height(label, height: Header.titleHeight)
            let width = Constraint.width(label, to: self)
            return [anchor.x,anchor.y,width,height]
         }
      }
   }
   /**
    * Creates buttons
    */
   func createButtonContainer() -> ButtonContainer{
      return with(.init(frame:.zero)){
         addSubview($0)
         let size:CGSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: ButtonContainer.height)
         $0.activateConstraints{ view in
            let anchor = Constraint.anchor(view, to: headerTitle, align: .topLeft, alignTo: .bottomLeft)
            let size = Constraint.size(view, size: .init(width: size.width, height: size.height))
            return [anchor.x,anchor.y,size.w,size.h]
         }
      }
   }
   /**
    * Create slider
    */
   func createSlider() -> Slider{
      let segmentCount:Int = HorView.CellType.types.count
      let size:CGSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: Slider.height)
      return with(.init(idx: 0, segmentCount:segmentCount , frame: CGRect.init(origin: .zero, size: size))){
         self.addSubview($0)
         $0.activateConstraints{ view in
            let anchor = Constraint.anchor(view, to: self, align: .bottomLeft, alignTo: .bottomLeft)
            let size = Constraint.size(view, size: CGSize.init(width: size.width, height: size.height))
            return [anchor.x,anchor.y,size.w,size.h]
         }
      }
   }
   /**
    * Graphic fix
    */
   func createGraphicFix() -> UIView{
      return with(.init(frame: .zero)) {
         $0.backgroundColor = .blue
         self.addSubview($0)
         $0.activateConstraints { view in
            let anchor = Constraint.anchor(view, to: self, align: .bottomLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: 500))
            return [anchor.x,anchor.y,size.w,size.h]
         }
      }
   }
}
