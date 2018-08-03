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


//let screenSize:CGSize = {
//    let size = UIScreen.main.bounds.size
//    return CGSize(width:size.width, height:size.height - Footer.footerHeight)
//}()
//page.activateConstraint { view in
//    let size = Constraint.size(page, size: screenSize)
//    let pos = Constraint.anchor(page, to: self.view, align: .topLeft, alignTo: .topLeft)
//    page.size = size
//    page.anchor = pos
//    return [pos.x,pos.y,size.w,size.h]
//}
