import UIKit

extension CustomTableView {
   /**
    * When an item is tapped
    */
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      Swift.print("Tapped idx: \(indexPath.row)")
   }
}
