import UIKit

class TertiaryHorCell:HorCell{
    override class var id : String {return "\(TertiaryHorCell.self)"}
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .lightGray/*Sets the background color of the view*/
    }
    /**
     * Boilerplate
     */
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
