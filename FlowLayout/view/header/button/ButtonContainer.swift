import UIKit

/**
 * Header
 */
class ButtonContainer:UIStackView {
    static let height:CGFloat = 60
    lazy var buttons:[HeaderButton2] = self.createButtons()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let bg = UIView()
        bg.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bg.backgroundColor = .yellow//debug I suppose
        self.addSubview(bg)/*Add a background to*/
        self.axis = .horizontal/*arrange subViews horizontally*/
        self.distribution  = .equalSpacing
        self.alignment = .center
        self.spacing = 0/*zero gaps between view*/
        _ = buttons
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonContainer {
    /**
     * Creates buttons
     */
    func createButtons() -> [HeaderButton2]{
        let titles:[String] = HorView.CellType.types.map{$0.rawValue}
        let boxW:CGFloat = UIScreen.main.bounds.size.width / CGFloat(titles.count) /*75p on iphone 8*/
        let buttons:[HeaderButton2] = titles.map{ title in
            let button = HeaderButton2.init(title: title)
//            button.backgroundColor = UIColorParser.random
            button.addTarget(self, action: #selector(onTouchInside), for: .touchUpInside)
            self.addArrangedSubview(button)
            button.activateConstraint{ view in /*Constraints*/
                let size = Constraint.size(view, size: CGSize(width:boxW,height:ButtonContainer.height))
                //let y = Constraint.anchor(view, to: self, align: .top, alignTo: .top)
                return [size.w,size.h/*,y*/ ]
            }
            return button/*All vertically centered, 30p height each*/
        }
        buttons.first?.setTitleColor(.white, for: .normal)
        buttons.first?.titleLabel?.font = .boldSystemFont(ofSize: 16)//
        return buttons
    }
}

/**
 * Handler
 */
extension ButtonContainer {
    /**
     * click
     */
    @objc func onTouchInside(sender:UIButton) {
        Swift.print("It Works!!! \(sender)")
        /*The bellow converts button to index*/
        if let headerBtn = sender as? HeaderButton2, let headerTitle = headerBtn.currentTitle, let cellType = HorView.CellType(rawValue: headerTitle) {
            let idx:Int = cellType.hashValue//0,1,2
            ((self.superview as? Header)?.superview as? HorView)?.setIdx(idx: idx)
            
//            setIdx(idx: 0)
            setActive(btn: headerBtn)
            //setIdx(idx: idx)
        }
    }
    /**
     *
     */
    func setIdx(idx:Int){
        Swift.print("BtnContainer.setIdx(idx)")
        let btnTitle:String? = HorView.CellType.fromHashValue(hashValue: idx)?.rawValue
        Swift.print("btnTitle:  \(btnTitle)")
        buttons.forEach{//⚠️️ use filter instead
            if $0.titleLabel?.text == btnTitle {
                setActive(btn:$0)
            }
        }
    }
    
    /**
     *
     */
    func setActive(btn:UIButton){
        Swift.print("setActive:  \(setActive)")
        buttons.forEach{
            if $0 == btn {//⚠️️ use filter instead
                $0.setActive(isActive: true)
            }else{
                $0.setActive(isActive: false)
            }
        }
    }
}


