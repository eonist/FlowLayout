import UIKit

//continue here 🏀
    //⚠️️ rename to FlowCell ✅
    //look at youtube code to remove the blank space etc.  ✅
    //look at how the youtube cell's are designed 👈
    //add BrowserView

/**
 * Browser cell for CollectionView
 */
class VerCell:UICollectionViewCell {
    class var id : String {return "\(VerCell.self)"}
//    lazy var imageView:UIImageView = self.createImgView()
//    lazy var titleLabel:UILabel = self.createTitleLabel()
//    lazy var descLabel:UILabel = self.createDescLabel()
//    public var highlight:HighlightResponse.HighLight? { didSet {
//        guard let highlight = highlight, highlight.episodes.count > 0, let firstEpisode:HighlightResponse.HighLight.Episode = Optional(highlight.episodes[0]) else {fatalError("highlight or first episode not available")}
//        imageView.setImage(webPath:firstEpisode.thumbnail)//"https://rawgit.com/stylekit/img/master/" + "pic_1_thumb.png"
//        titleLabel.text = highlight.name
//        descLabel.text = "\(highlight.episodes.count) " + (highlight.episodes.count > 0 ? "Episodes" : "Episode")
//        }
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColorParser.random//UIColorParser.random
//        self.layoutMargins = UIEdgeInsetsMake(0,0,0,0)
//        _ = imageView
//        _ = titleLabel
//        _ = descLabel
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
