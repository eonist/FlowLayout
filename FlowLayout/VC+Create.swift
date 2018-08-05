import UIKit

/**
 * Create
 */
extension ViewController{
    /**
     * Create the FlowView
     */
    func createFlowView() -> HorView{
        let flowView:HorView = HorView.init(frame: UIScreen.main.bounds)
        self.view.addSubview(flowView)
        let screenSize:CGSize = {
            let size = UIScreen.main.bounds.size
            return CGSize(width:size.width, height:size.height)
        }()
        flowView.activateConstraint { view in
            let size = Constraint.size(view, size: screenSize)
            let pos = Constraint.anchor(view, to: self.view, align: .topLeft, alignTo: .topLeft)
            return [pos.x,pos.y,size.w,size.h]
        }
        return flowView
    }
}
