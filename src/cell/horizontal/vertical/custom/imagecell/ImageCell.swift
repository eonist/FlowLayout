import UIKit
/**
 * Beta
 */
class ImageCell:UITableViewCell{
    lazy var imgView: UIImageView = self.createImgView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none/*Disables the selection highlighting*/
        _ = imgView/*Initiate UI's*/
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/**
 * Accessor
 */
extension ImageCell{
    /**
     * 
     */
//    func setImage(){
//        //
//    }
}

