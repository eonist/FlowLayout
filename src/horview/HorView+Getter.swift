import Foundation

extension HorView {
   /**
    * Calculates the current page
    */
   internal var currentPageIndex: Int {
      let x: CGFloat = collectionView.contentOffset.x
      let w: CGFloat = collectionView.bounds.size.width
      let currentPage: Int = .init(round(x / w))
      return currentPage
   }
}
