import UIKit

class MatchCell: BaseCell {
   lazy var homeTeamLabel: UILabel = createHomeTeamLabel()
   lazy var awayTeamLable: UILabel = createAwayTeamLabel()
   lazy var dateLabel: UILabel = createDateLabel()
   /**
    * When you set the data, the diferent UI's will be updated
    */
   override var data: CellDataKind? {
      didSet {
         guard let data: MatchCellData = data as? MatchCellData else { fatalError("data not avaiable") }
         homeTeamLabel.text = data.homeTeam
         awayTeamLable.text = data.awayTeam
         dateLabel.text = data.date //update ui
      }
   }
}
