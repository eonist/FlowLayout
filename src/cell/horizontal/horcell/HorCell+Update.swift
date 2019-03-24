import Foundation
/**
 * Update
 */
extension HorCell{
    /**
     * Updates the TableView items
     */
    func updateCollectionView(){
//        Swift.print("Update collectionView👌")
        DispatchQueue.main.async {/*jump on the main thread for UI update*/
            //Swift.print("got json from remote 👌")
            self.items = [0,1,2,3,4,5,7]//7,8,9,10,11,12
            self.collectionView.reloadData()/*Updates collectionView*/
        }
    }
}
