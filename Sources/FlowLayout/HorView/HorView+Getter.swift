#if os(iOS)
import QuartzCore

extension HorView {
   /**
    * Calculates the current page
    */
   internal var currentPageIndex: Int {
      let x: CGFloat = collectionView.contentOffset.x
      let w: CGFloat = collectionView.bounds.size.width
      return .init(round(x / w))
   }
}

#endif
