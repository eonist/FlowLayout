import UIKit

class PrimaryVerCell:VerCell{
    override class var id : String {return "\(PrimaryCell.self)"}
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        addCirce()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * Adds a UIView that is round
     */
    func addCirce(){
        let rect = CGRect.init(origin: .zero, size: CGSize.init(width: self.frame.width, height: self.frame.width))
        let view:UIView = UIView.init(frame: rect)
        addSubview(view)
        view.layer.cornerRadius = self.frame.width/2
        view.layer.masksToBounds = true
        view.backgroundColor = UIColorParser.random
    }
}
