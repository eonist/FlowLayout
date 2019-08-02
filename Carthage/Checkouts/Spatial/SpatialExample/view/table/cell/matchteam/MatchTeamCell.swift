import UIKit
import Spatial
import With

class MatchTeamCell: BaseCell {
   lazy var homeTeamLabel: UILabel = createHomeTeamLabel()
   lazy var awayTeamLabel: UILabel = createAwayTeamLabel()
   lazy var versusLabel: UILabel = createVersusLabel()
   /**
    * When you set the data, the diferent UI's will be updated
    */
   override var data: CellDataKind? {
      didSet {
         guard let data: MatchTeamCellData = data as? MatchTeamCellData else { fatalError("data not avaiable") }
         homeTeamLabel.text = data.homeTeam //update ui
         awayTeamLabel.text = data.awayTeam
         _ = versusLabel
      }
   }
}
/**
 * Create
 */
extension MatchTeamCell {
   /**
    * Home
    */
   func createHomeTeamLabel() -> UILabel {
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
   func createAwayTeamLabel() -> UILabel {
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
         $0.anchorAndSize(to: self.contentView, height: 32, align: .centerCenter, alignTo: .centerCenter, offset: .init(x: Margin.horizontal, y: Margin.vertical) )
      }
   }
}
/**
 * Constants
 */
extension MatchTeamCell {
   static let backgroundColor: UIColor = .blue
   static let cellHeight: CGFloat = 124
   static let cellReuseIdendifier: String = "\(MatchTeamCell.self)"
   enum Margin {
      static let horizontal: CGFloat = 12
      static let vertical: CGFloat = 0//12
      static let verticalSpaceBetween: CGFloat = 4
   }
}
