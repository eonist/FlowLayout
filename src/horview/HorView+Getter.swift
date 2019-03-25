import Foundation

extension HorView{
   /**
    * Calculates the current page
    */
   var currentPageIndex:Int {
      let x = collectionView.contentOffset.x
      let w = collectionView.bounds.size.width
      let currentPage:Int = Int(round(x/w))
      return currentPage
   }
}