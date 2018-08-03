import UIKit

extension HorView{
    /**
     * TODO: ⚠️️ Might want to make a bool flag to avoid calling if the page was the same as the last
     */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        Swift.print("scrollViewDidEndDecelerating")
        let x = collectionView.contentOffset.x
        let w = collectionView.bounds.size.width
        let currentPage = Int(round(x/w))
        // Do whatever with currentPage.
        Swift.print("on paging complete:\(currentPage)")
        header.setTitleIdx(idx: currentPage)
        header.buttonContainer.setIdx(idx: currentPage)
    }
    /**
     * 
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //        Swift.print("⚠️️ scrollViewDidScroll")
        //        Swift.print("collectionView:  \(collectionView)")
        //        Swift.print("collectionView.contentOffset:  \(collectionView.contentOffset)")
        //        guard curPage > -2 else {curPage = -1; return }//UICollectionView
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentProgress = ((x/w))
        header.slider.setProgress(progress: currentProgress)
        // Do whatever with currentPage.
        //        Swift.print("on paging complete:\(currentPage)")
        //        if curPage != currentPage {
        //            if currentPage >= 0 && currentPage < items.count {
        //                header.setIdx(idx: currentPage)
        //            }else {Swift.print("Out of bound at: \(currentPage)")}
        //            curPage = currentPage
        //        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        Swift.print("scrollViewWillEndDragging")
        
        //        if curPage != currentPage {
        //            if currentPage >= 0 && currentPage < items.count {
        //                header.setIdx(idx: currentPage)
        //            }else {Swift.print("Out of bound at: \(currentPage)")}
        //            curPage = currentPage
        //        }
    }
}
