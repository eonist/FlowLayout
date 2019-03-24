import UIKit

class HeaderButton:CustomButton{
    var clickCallBack:ClickCallBack = HeaderButton.defaultClickCallBack//TODO: ⚠️️ move to exitbtn
    override init(title: String) {
        super.init(title: title)
        self.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderButton{
    typealias ClickCallBack = ()->Void
    static var defaultClickCallBack = { Swift.print("HeaderButton.defaultClickCallBack() - no call back attached") }
    /**
     * Selector handler
     */
    @objc func buttonTouched(sender:UIButton) {
        clickCallBack()/*Calls whichever method that is attached to the call-back variable*/
    }
}

extension HeaderButton{
    static let width:CGFloat = 60
    static let height:CGFloat = 20
}

extension HeaderButton{
    /**
     * Sets the button to active mode
     */
    func setActive(isActive:Bool){
        if isActive {
            self.setTitleColor(.white, for: .normal)
            self.titleLabel?.font = .boldSystemFont(ofSize: 16)
        }else {
            self.titleLabel?.font = .systemFont(ofSize: 16)//.boldSystemFont(ofSize: 14)//
            self.setTitleColor(UIColor.black, for: .normal)
        }
    }
}
