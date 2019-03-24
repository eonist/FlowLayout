import UIKit
import Spatial

class Slider:UIView{
    lazy var sliderBar:SliderBar = createSliderBar()
    let segmentCount:Int
    let idx:Int
    init(idx:Int, segmentCount:Int, frame: CGRect) {
        self.segmentCount = segmentCount
        self.idx = idx
        super.init(frame: frame)
        backgroundColor = .blue
        _ = sliderBar
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
