import UIKit

extension CustomTableView {
   /**
    * Returns row count in a section
    */
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return rowData.count
   }
   /**
    * Creates/Recycles cells
    */
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //      let rowIndex:Int =
      let cell: UITableViewCell = {
         switch indexPath.row {
         case 0, 1:
            guard let cell: InputTextCell = tableView.dequeueReusableCell(withIdentifier: "\(InputTextCell.self)", for: indexPath as IndexPath) as? InputTextCell else { fatalError("err") }
            cell.backgroundColor = .purple
            cell.data = LeagueCellData(team: "Cognative resolution", placement: "Description: ")
            return cell as InputTextCell
         default:
            let cell: UITableViewCell = .init()
            cell.backgroundColor = .gray
            return cell
//            fatalError("Not supported")
         }
      }()
      return cell
   }
   /**
    * Returns the height of each cell
    */
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      switch indexPath.row {
      case 2: return 96//fatalError("")
      default: return 96//fatalError("")
         //      case is 0:
         //      return 128
         //      default:
         //
      }
   }
   func registerCells() {
      self.register(MatchCell.self, forCellReuseIdentifier: "\(MatchCell.self)")
      self.register(InputTextCell.self, forCellReuseIdentifier: "\(InputTextCell.self)")
      self.register(MatchTeamCell.self, forCellReuseIdentifier: "\(MatchTeamCell.self)")
      self.register(MatchScoreCell.self, forCellReuseIdentifier: "\(MatchScoreCell.self)")
      self.register(InputTextCell.self, forCellReuseIdentifier: "\(InputTextCell.self)")
   }
}
