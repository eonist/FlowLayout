#if os(iOS)
import UIKit
import Spatial
/**
 * - Abstract: The topBar slider that indicates where you are horizontally
 */
final class Slider: UIView {
   lazy var sliderBar: SliderBar = createSliderBar()
   let segmentCount: Int
   let idx: Int
   /**
    * - Fixme: ⚠️️ add doc
    */
   init(idx: Int, segmentCount: Int, frame: CGRect) {
      self.segmentCount = segmentCount
      self.idx = idx
      super.init(frame: frame)
      backgroundColor = HorView.style.slider.backgroundColor
      _ = sliderBar
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

#endif
