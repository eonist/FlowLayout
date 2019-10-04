import UIKit
/**
 * Provides a way to show a DescriptionLabel and and InputTextField in a TableCell
 */
class InputTextCell: BaseCell {
    lazy var descLabel: UILabel = createDescLabel()
    lazy var inputTextField: UITextField = createInputTextField()
    /**
     * When you set the data, the diferent UI's will be updated
     */
    override var data: CellDataKind? {
        didSet {
            guard let data: LeagueCellData = data as? LeagueCellData else { fatalError("data not avaiable") }
            descLabel.text = data.placement // update ui
            inputTextField.text = data.team
        }
    }
}
