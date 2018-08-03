import Foundation

/**
 *
 */
extension HorCell{
    /**
     * Gets all the transactions and updates the TableView items
     */
    func updateCollectionView(){
        Swift.print("update collectionView👌")
        DispatchQueue.main.async {//jump on the main thread for UI update
            //Swift.print("got json from remote 👌")
            self.items = [0,1,2,3,4,5,7]//77,8,9,10,11,12
            self.collectionView.reloadData()//updates collectionView
        }
    }
}
