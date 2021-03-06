#if os(iOS)
import UIKit
import Spatial
import With
/**
 * HorView
 */
extension HorView {
   /**
    * Creates header
    */
   @objc open func createHeader() -> Header {
      with(.init()) { // Header has title, buttons, slider
         addSubview($0)
         $0.anchorAndSize(to: self, height: Header.height)
         $0.buttonContainer.onButtonClick = onButtonClick
      }
   }
   /**
    * Creates horizontal collectionview
    * - Note: Overridable in subclass for customization
    * - Fixme: ⚠️️ rename to createColumnView
    */
   @objc open func createCollectionView() -> UICollectionView {
      let flowLayout: UICollectionViewFlowLayout = createLayout()
      return with(.init(frame: self.frame, collectionViewLayout: flowLayout)) {
         $0.dataSource = self // We must set datasource because the framework is view based not VC based
         $0.delegate = self // We must set delegate because the framework is view based not VC based
         $0.backgroundColor = .clear
         $0.contentInset = .zero // Reset contentInset
         $0.scrollIndicatorInsets = .zero // Reset scrollIndicator insets
         $0.isPagingEnabled = true // Makes each cell snap to whole integers
         $0.showsHorizontalScrollIndicator = false // Hides scrollbar
         self.insertSubview($0, belowSubview: header)
         $0.anchorAndSize(to: self)
      }
   }
}
/**
 * Create
 */
extension HorView {
   /**
    * Returns layout
    */
   private func createLayout() -> UICollectionViewFlowLayout {
      with(.init()) {
         $0.itemSize = UIScreen.main.bounds.size // The size of each collection item
         $0.scrollDirection = .horizontal // Enables horizontal scrolling direction
         $0.minimumLineSpacing = 0 // Removes the line-spacing between cells
      }
   }
}

#endif
