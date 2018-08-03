import UIKit

/**
 * Update
 */
extension HorView{
    /**
     * Gets all the transactions and updates the TableView items
     */
    func updateCollectionView(){
        Swift.print("update collectionView 👌")
        DispatchQueue.main.async {//jump on the main thread for UI update
            //Swift.print("got json from remote 👌")
            self.items = [.primary,.secondary,.tierary]//,3,4,5,5,7,8,9,10,11,12
            self.collectionView.reloadData()//updates collectionView
        }
    }
}
