import UIKit
import ReusableCell_iOS
///
/// - Abstract: Provides a way to show a DescriptionLabel and and InputTextField in a TableCell
/// - Remark: Left-aligned Label and Right-Aligned content TextField
///
open class TextCell: BaseCell, ReusableCellKind {
    public lazy var descriptionLabel: UILabel = createDescriptionLabel()
    public lazy var contentTextField: UITextField = createContentTextField()
    ///
    /// - Abstract: When you set the data, the diferent UI's will be updated
    ///
   override public var data: CellDataKind? {
        didSet {
            guard let data: TextCellData = data as? TextCellData else { return }
            descriptionLabel.text = data.description
            contentTextField.text = data.content
        }
    }
}
