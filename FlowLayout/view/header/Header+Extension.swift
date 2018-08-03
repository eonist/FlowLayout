import UIKit
/**
 * Create
 */
extension Header {
    /**
     * TODO: ⚠️️ Make the headerTitle it's own class
     */
    func createHeaderTitle() -> UILabel{
        let label = UILabel()
        label.text = HorView.CellType.primary.rawValue
        label.font = label.font.withSize(22)
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.textColor = .white//UIColor(hex:"EBCF4B")
        self.addSubview(label)
        label.activateConstraint{ label in
            let anchor = Constraint.anchor(label, to: self, align:.topLeft, alignTo: .topLeft)
            let height = Constraint.height(label, height: Header.titleHeight)
            let width = Constraint.width(label, to: self)
            return [anchor.x,anchor.y,width,height]
        }
        return label
    }
    /**
     * Creates buttons
     */
    func createButtonContainer() -> ButtonContainer{
        let buttonContainer:ButtonContainer = ButtonContainer.init(frame:.zero)
        addSubview(buttonContainer)
        let size:CGSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: ButtonContainer.height)
        buttonContainer.activateConstraint{ view in
            let anchor = Constraint.anchor(view, to: headerTitle, align: .topLeft, alignTo: .bottomLeft)
            let size = Constraint.size(view, size: CGSize.init(width: size.width, height: size.height))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        return buttonContainer
    }
    /**
     * Create slider
     */
    func createSlider() -> Slider{
        let segmentCount:Int = HorView.CellType.types.count
        let size:CGSize = CGSize.init(width: UIScreen.main.bounds.size.width, height: Slider.height)
        let slider = Slider.init(idx: 0, segmentCount:segmentCount , frame: CGRect.init(origin: .zero, size: size))
        self.addSubview(slider)
        slider.activateConstraint{ view in
            let anchor = Constraint.anchor(view, to: self, align: .bottomLeft, alignTo: .bottomLeft)
            let size = Constraint.size(view, size: CGSize.init(width: size.width, height: size.height))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        return slider
    }
    /**
     *
     */
    func createGraphicFix() -> UIView{
        let fix = UIView.init(frame: .zero)
        fix.backgroundColor = .blue
        self.addSubview(fix)
        fix.activateConstraint { view in
            let anchor = Constraint.anchor(view, to: self, align: .bottomLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: 500))
            return [anchor.x,anchor.y,size.w,size.h]
        }
        
        return fix
    }
}
/**
 * Accessor
 */
extension Header {
    /**
     * Set index
     */
    func setIdx(idx:Int){
        Swift.print("Header.setIdx")
//        slider.setIdx(idx: idx)
//        setTitleIdx(idx: idx)
    }
    /**
     * Set index for title label
     */
    func setTitleIdx(idx:Int){
        let title:String = HorView.CellType.fromHashValue(hashValue: idx)?.rawValue ?? "undefined"
        headerTitle.text = title
    }
}
/**
 * Const
 */
extension Header {
   static let height:CGFloat = 130
   static let titleHeight:CGFloat = 60
}
