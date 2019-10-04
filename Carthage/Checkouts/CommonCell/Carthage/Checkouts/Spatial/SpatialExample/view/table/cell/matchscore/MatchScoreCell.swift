import UIKit
import Spatial
import With

class MatchScoreCell: BaseCell {
   lazy var homeScoreLabel: UILabel = createHomeScoreLabel()
   lazy var awayScoreLabel: UILabel = createAwayScoreLabel()
   lazy var versusLabel: UILabel = createVersusLabel()
   /**
    * When you set the data, the diferent UI's will be updated
    */
   override var data: CellDataKind? {
      didSet {
         guard let data: MatchScoreCellData = data as? MatchScoreCellData else { fatalError("data not avaiable") }
         homeScoreLabel.text = data.homeScore //update ui
         awayScoreLabel.text = data.awayScore
         _ = versusLabel
      }
   }
}
/**
 * Create
 */
extension MatchScoreCell {
   /**
    * Home
    */
   func createHomeScoreLabel() -> UILabel {
      return with(.init()) {
         $0.text = "title"
         $0.font = .boldSystemFont(ofSize: 20.0)
         $0.textColor = .black
         $0.backgroundColor = .orange
         $0.textAlignment = .left
         self.contentView.addSubview($0)
         $0.backgroundColor = .clear
         $0.anchorAndSize(to: self.contentView, height: 32, align: .centerLeft, alignTo: .centerLeft, offset: .init(x: Margin.horizontal, y: Margin.vertical))
      }
   }
   /**
    * Away
    */
   func createAwayScoreLabel() -> UILabel {
      return with(.init()) {
         $0.text = "title"
         $0.font = .boldSystemFont(ofSize: 20.0)
         $0.textColor = .black
         $0.backgroundColor = .yellow
         $0.textAlignment = .right
         self.contentView.addSubview($0)
         $0.backgroundColor = .clear
         $0.anchorAndSize(to: self.contentView, height: 32, align: .centerRight, alignTo: .centerRight, offset: .init(x: -Margin.horizontal, y: Margin.vertical))
      }
   }
   /**
    * Versus
    */
   func createVersusLabel() -> UILabel {
      return with(.init()) {
         $0.text = " - "
         $0.font = .boldSystemFont(ofSize: 20)
         $0.textColor = .black
         $0.backgroundColor = .gray
         $0.textAlignment = .center
         self.contentView.addSubview($0)
         $0.backgroundColor = .clear
         $0.anchorAndSize(to: self.contentView, height: 32, align: .centerCenter, alignTo: .centerCenter, offset: .init(x: Margin.horizontal, y: Margin.vertical))
      }
   }
}
/**
 * Constants
 */
extension MatchScoreCell {
   static let backgroundColor: UIColor = .blue
   static let cellHeight: CGFloat = 124
   static let cellReuseIdendifier: String = "\(MatchScoreCell.self)"
   enum Margin {
      static let horizontal: CGFloat = 12
      static let vertical: CGFloat = 0//12
      static let verticalSpaceBetween: CGFloat = 4
   }
}
