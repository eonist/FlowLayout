import UIKit

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
/**
 * Create
 */
extension Slider{
    static let height:CGFloat = 10
    var sliderBarWidth:CGFloat {return self.frame.width / CGFloat(segmentCount)}
    /**
     * Creates the slider bar
     */
    func createSliderBar() -> SliderBar{
        let size:CGSize = CGSize.init(width: sliderBarWidth, height: Slider.height)
        let sliderBar:SliderBar = SliderBar.init(frame: CGRect.init(origin: frame.origin, size: size))
        addSubview(sliderBar)
        /*Constraints*/
        sliderBar.activateConstraintKind { view in
            let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: size)
            return (anchor:anchor, size:size)
        }
        return sliderBar
    }
}
/**
 * Accesor
 */
extension Slider{
    /**
     * Set index
     */
    func setIdx(idx:Int){
        Swift.print("Slider.setIdx")
        let x:CGFloat = sliderBarWidth * CGFloat(idx)
        animate(to: x)
    }
    /**
     *
     */
    func setProgress(progress:CGFloat){
        let x:CGFloat = sliderBarWidth * progress
        setProgress(to: x)
    }
    /**
     *
     */
    func setProgress(to:CGFloat){
        let newConstraintClosure = {/*Animate to this*/
            guard let anchor = self.sliderBar.anchor else {fatalError("err anchor not available")}
            NSLayoutConstraint.deactivate([anchor.x])/*Deactivate the current active constraint*/
            let xConstraint = Constraint.anchor(self.sliderBar, to: self, align: .left, alignTo: .left, offset: to)
            NSLayoutConstraint.activate([xConstraint/*,pos.y*/])
            self.sliderBar.anchor?.x = xConstraint
        }
        newConstraintClosure()/*Set the new constraints*/
    }
}
/**
 * Animation
 */
extension Slider{
    /**
     * PARAM: to: the amount to offset in the X dir
     * PARAM: onComplete: called when the animation completes
     */
    func animate(to:CGFloat, onComplete:@escaping () -> Void = {}){
        
        UIView.animate({/*animate*/
            self.setProgress(to: to)
            self.layoutIfNeeded()
        }, onComplete:onComplete)
    }
}


