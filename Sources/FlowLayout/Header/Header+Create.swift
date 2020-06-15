import UIKit
import Spatial
import With
/**
 * Create
 */
extension Header {
   /**
    * TopFix (to cover up a void space)
    */
   func createTopFix() -> UIView {
      with(.init()) {
         self.addSubview($0)
         $0.anchorAndSize(to: self, height: Slider.height, align: .topLeft, alignTo: .topLeft)
         $0.backgroundColor = HorView.style.header.backgroundColor
      }
   }
   /**
    * Creates header title
    */
   func createHeaderTitle() -> HeaderTitle {
      with(.init()) {
         $0.setTitleText(text: HorView.CellType.primary.rawValue.capitalized)
         self.addSubview($0)
         $0.anchorAndSize(to: self.topFix, sizeTo: self, height: HeaderTitle.height, align: .topLeft, alignTo: .bottomLeft)
      }
   }
   /**
    * Creates buttons
    */
   func createButtonContainer() -> ButtonContainer {
      with(.init(frame: .zero)) {
         addSubview($0)
         $0.anchorAndSize(to: headerTitle, sizeTo: self, height: ButtonContainer.height, align: .topLeft, alignTo: .bottomLeft)
      }
   }
   /**
    * Create slider
    */
   func createSlider() -> Slider {
      let segmentCount: Int = HorView.CellType.allCases.count
      return with(.init(idx: 0, segmentCount:segmentCount, frame: .zero)) {
         self.addSubview($0)
         $0.anchorAndSize(to: self, height: Slider.height, align: .bottomLeft, alignTo: .bottomLeft)
      }
   }
   /**
    * Graphic fix (When you drag the list up and down this covers to match header color)
    * - Note: Basically you can drag down the header 500px before it shows
    * - Note: this doesn't need to be saved as a param
    */
   func createBackgroundFix() -> UIView {
      with(.init(frame: .zero)) {
         $0.backgroundColor = HorView.style.header.backgroundColor
         self.addSubview($0)
         $0.anchorAndSize(to: self, height: 500, align: .bottomLeft, alignTo: .topLeft)
      }
   }
}
