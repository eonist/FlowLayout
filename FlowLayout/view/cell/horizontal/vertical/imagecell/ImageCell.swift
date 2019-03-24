import UIKit

class ImageCell:UITableViewCell{
    lazy var imgView:UIImageView = self.createImgView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none/*Disables the selection highlighting*/
        /*Initiate UI's*/
        _ = imgView
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

