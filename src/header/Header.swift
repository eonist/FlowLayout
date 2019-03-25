import UIKit
/**
 * Header (title,buttons,slider)
 */
open class Header:UIView {
    lazy var headerTitle:UILabel = self.createHeaderTitle()
    lazy var buttonContainer:ButtonContainer = self.createButtonContainer()
    lazy var slider:Slider = self.createSlider()
//    static let sharedInstance = Header()/*A singleton is justified because only one header can exist, and hocking up callbacks through 2 CollectionViews would bloat the app*/
    override public init(frame: CGRect) {
        super.init(frame: frame)
//        let bg = UIView()
//        bg.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //bg.backgroundColor = .red/*debug I suppose*/
        self.backgroundColor = HorView.headerStyle.backgroundColor
        _ = createGraphicFix()
        _ = headerTitle
        _ = buttonContainer
        _ = slider
    }
    /**
     * Boilerplate
     */
   required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
