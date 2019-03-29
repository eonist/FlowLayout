import UIKit
/**
 * Update
 */
extension HorView{
   /**
    * Gets all the transactions and updates the TableView items
    */
   func updateCollectionView(){
      //Swift.print("update collectionView 👌")
      DispatchQueue.main.async {/*jump on the main thread for UI update*/
         //Swift.print("got json from remote 👌")
         self.items = [.primary,.secondary,.tertiary]//,3,4,5,5,7,8,9,10,11,12
         self.collectionView.reloadData()//updates collectionView
      }
   }
   /**
    * onButtonClick (When user clicks header buttons)
    */
   func onButtonClick(buttonTitle:String){
      if let cellType = HorView.CellType(rawValue: buttonTitle) {
         let idx:Int = cellType.idx/*0,1,2, converts button to index*/ 
         self.setIdx(idx: idx)
         self.header.buttonContainer.setIdx(idx: idx)
      }
   }
}
