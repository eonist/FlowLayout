import UIKit
/**
 * Beta (Experimental)
 */
class ImageCell: UITableViewCell {
    lazy var imgView: UIImageView = self.createImgView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none // Disables the selection highlighting
        _ = imgView // Initiate UI's
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
