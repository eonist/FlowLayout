import UIKit

class ImageCell:UITableViewCell{
    lazy var imgView:UIImageView = self.createImgView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
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
/**
 * Create
 */
extension ImageCell{
    /**
     * Creates ImgView
     */
    func createImgView() -> UIImageView {
        let imgView:UIImageView = {/*Create the image view*/
            let view = UIImageView()
            view.contentMode = .scaleAspectFill/*Fills the view*/
            view.backgroundColor = .lightGray
            return view
        }()
        _ = {/*adds a ciruclar mask to the image-view*/
            let cornerRadius = self.contentView.frame.height/2
            //Swift.print("cornerRadius:  \(cornerRadius)")
            imgView.layer.cornerRadius = cornerRadius
            imgView.clipsToBounds = true
        }()
        self.contentView.addSubview(imgView)
        _ = {/*adds constraints*/
            imgView.translatesAutoresizingMaskIntoConstraints = false
            let tl = Constraint.anchor(imgView, to: self.contentView, align: .topLeft, alignTo: .topLeft, offset:CGPoint(), useMargin:true)
            let bl = Constraint.anchor(imgView, to: self.contentView, align: .bottomLeft, alignTo: .bottomLeft, offset:CGPoint(), useMargin:true)
            //            let b = Constraint.anchor(view, to: self.contentView, align: .bottom, alignTo: .bottom, offset:0,useMargin:true)
            let size = Constraint.size(imgView, size: CGSize(width:self.contentView.frame.height,height:self.contentView.frame.height))
            //            let x = Constraint.anchor(view, to: self.contentView, align: .left, alignTo: .left,offset:0,useMargin:true)
            //            let h = Constraint.height(view, to: self)//height, h,h
            NSLayoutConstraint.activate([tl.x,tl.y,size.w,bl.y,bl.x,size.h])
        }()
        return imgView
    }
}

