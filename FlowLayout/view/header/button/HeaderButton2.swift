import UIKit

class HeaderButton2:CustomButton{
//    var toggle:Bool = false
    var clickCallBack:ClickCallBack = HeaderButton2.defaultClickCallBack//TODO: ⚠️️ move to exitbtn
    override init(title: String) {
        super.init(title: title)
        self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderButton2{
    typealias ClickCallBack = ()->Void
    static var defaultClickCallBack = { Swift.print("no call back attached")}
    
    @objc func buttonTouched(sender:UIButton) {
        Swift.print("buttonTouched")
//        toggle = !toggle
        
        clickCallBack()
    }
}
extension HeaderButton2{
    static let width:CGFloat = 60
    static let height:CGFloat = 20
//    static let initX:CGFloat = -HeaderButton2.height
}

extension HeaderButton2{
    /**
     *
     */
    func setActive(isActive:Bool){
        if isActive {
//            self.backgroundColor = UIColor.lightGray//idle
            self.setTitleColor(.white, for: .normal)
            self.titleLabel?.font = .boldSystemFont(ofSize: 16)//
        }else {
//            self.backgroundColor = UIColor.blue//active
            self.titleLabel?.font = .systemFont(ofSize: 16)//.boldSystemFont(ofSize: 14)//
            self.setTitleColor(UIColor.black, for: .normal)
        }
    }
}
