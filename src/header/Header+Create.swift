import UIKit
import Spatial
import With
/**
 * Create
 */
extension Header {
   /**
    * TopFix
    */
   func createTopFix() -> UIView{
//      Swift.print("createTopFix")
      return with(.init()){
         self.addSubview($0)
         $0.anchorAndSize(to: self, height: Slider.height, align: .topLeft, alignTo: .topLeft)
         $0.backgroundColor = HorView.style.header.backgroundColor
      }
   }
   /**
    * - TODO: ⚠️️ Make the headerTitle it's own class
    */
   func createHeaderTitle() -> UILabel{
      return with(.init()){
         $0.text = HorView.CellType.primary.rawValue
         $0.font = HorView.style.header.title.font
         $0.textAlignment = .center
         $0.backgroundColor = .clear
         $0.textColor = HorView.style.header.title.color//UIColor(hex:"EBCF4B")
         self.addSubview($0)
         $0.anchorAndSize(to: self.topFix, sizeTo:self, height: Header.titleHeight, align: .topLeft, alignTo: .bottomLeft)
      }
   }
   /**
    * Creates buttons
    */
   func createButtonContainer() -> ButtonContainer{
      return with(.init(frame:.zero)){
         addSubview($0)
         $0.anchorAndSize(to: headerTitle, sizeTo: self, height: ButtonContainer.height, align: .topLeft, alignTo: .bottomLeft)
      }
   }
   /**
    * Create slider
    */
   func createSlider() -> Slider{
      let segmentCount:Int = HorView.CellType.types.count
      return with(.init(idx: 0, segmentCount:segmentCount , frame: .zero)){
         self.addSubview($0)
         $0.anchorAndSize(to: self, height: Slider.height, align: .bottomLeft, alignTo: .bottomLeft)
      }
   }
   /**
    * Graphic fix (When you drag the list up and down this covers to match header color)
    */
   func createGraphicFix() -> UIView{
      return with(.init(frame: .zero)) {
         $0.backgroundColor = HorView.style.header.backgroundColor
         self.addSubview($0)
         $0.anchorAndSize(to: self, height: 500, align: .bottomLeft, alignTo: .topLeft)
      }
   }
}
