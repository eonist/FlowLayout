import UIKit
/**
 * Update
 */
extension HorView {
   /**
    * Gets all the transactions and updates the TableView items
    * - Abstract: We call this after we receive data from a webservice
    * - Fixme: ⚠️️ Add weak self here
    */
   func updateCollectionView() {
      DispatchQueue.main.async { // Jump on the main thread for UI update
         self.items = [.primary, .secondary, .tertiary] // 3, 4, 5, 5, 7, 8, 9, 10, 11, 12
         self.collectionView.reloadData() // Updates collectionView
      }
   }
   /**
    * onButtonClick (When user clicks header buttons)
    * - Fixme: ⚠️️ Move to +Event file
    */
   func onButtonClick(buttonTitle: String) {
      if let cellType = ColumnCellType(rawValue: buttonTitle.lowercased()) {
         guard let idx: Int = cellType.idx else { return } // 0, 1, 2 converts button to index
         self.setIdx(idx: idx)
         self.header.buttonContainer.setIdx(idx: idx)
      }
   }
}
