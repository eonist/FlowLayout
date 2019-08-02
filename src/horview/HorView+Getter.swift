import Foundation

extension HorView {
   /**
    * Calculates the current page
    */
   internal var currentPageIndex: Int {
      let x = collectionView.contentOffset.x
      let w = collectionView.bounds.size.width
      let currentPage: Int = .init(round(x / w))
      return currentPage
   }
}
