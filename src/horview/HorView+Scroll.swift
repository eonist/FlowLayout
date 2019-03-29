import UIKit
/**
 * Scrolling
 * - Note: Pagining in iOS is snapping to whole pages
 * - Reference: Horizontal CollectionView: https://github.com/maximbilan/UICollectionViewHorizontalPaging
 */
extension HorView{
   /**
    * - TODO: ⚠️️ Might want to make a bool flag to avoid calling if the page was the same as the last
    */
   public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      //Swift.print("scrollViewDidEndDecelerating - on paging complete:\(currentPage)")
      header.setTitleIdx(idx: currentPageIndex)
      header.buttonContainer.setIdx(idx: currentPageIndex)
   }
   /**
    * Called when the user scrolls in the horizontal direction
    * - Important: ⚠️️ You want to reference the param instead of self.collectionView, as the collection view isnt ready when viewDidScroll is called. Its called on the init of the app.
    */
   public func scrollViewDidScroll(_ scrollView: UIScrollView) {
      //Swift.print("⚠️️ scrollViewDidScroll")
      let x = scrollView.contentOffset.x
      let w = scrollView.bounds.size.width
      let currentProgress = (x/w)
      header.slider.setProgress(progress: currentProgress)/*Moves the slider left and right*/
   }
   /**
    * Called when the user releases the thumb on screen
    */
   public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      //Swift.print("scrollViewWillEndDragging")
   }
}
