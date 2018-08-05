import UIKit

extension HorView{
    /**
     * TODO: ⚠️️ Might want to make a bool flag to avoid calling if the page was the same as the last
     */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //Swift.print("scrollViewDidEndDecelerating")
        let x = collectionView.contentOffset.x
        let w = collectionView.bounds.size.width
        let currentPage = Int(round(x/w))/*Calculates the current page*/
        //Swift.print("on paging complete:\(currentPage)")
        header.setTitleIdx(idx: currentPage)
        header.buttonContainer.setIdx(idx: currentPage)
    }
    /**
     * Called when the user scrolls in the horizontal direction
     * IMPORTANT: ⚠️️ You want to reference the param instead of self.collectionView, as the collection view isnt ready when viewDidScroll is called. Its called on the init of the app.
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Swift.print("⚠️️ scrollViewDidScroll")
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentProgress = (x/w)
        header.slider.setProgress(progress: currentProgress)/*Moves the slider left and right*/
    }
    /**
     * Called
     */
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //Swift.print("scrollViewWillEndDragging")
    }
}
