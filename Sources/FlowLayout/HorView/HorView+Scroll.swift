import UIKit
/**
 * Scrolling
 * - Note: Pagining in iOS is snapping to whole pages
 * - Reference: Horizontal CollectionView: https://github.com/maximbilan/UICollectionViewHorizontalPaging
 */
extension HorView {
   /**
    * - Fixme: ⚠️️ Might want to make a bool flag to avoid calling if the page was the same as the last
    */
   public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      header.setTitleIdx(idx: currentPageIndex)
      header.buttonContainer.setIdx(idx: currentPageIndex)
   }
   /**
    * Called when the user scrolls in the horizontal direction
    * - Important: ⚠️️ You want to reference the param instead of self.collectionView, as the collection view isnt ready when viewDidScroll is called. Its called on the init of the app.
    */
   public func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let x = scrollView.contentOffset.x
      let w = scrollView.bounds.size.width
      let currentProgress = x / w
      header.slider.setProgress(progress: currentProgress)/*Moves the slider left and right*/
   }
}
