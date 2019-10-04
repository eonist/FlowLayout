import UIKit
import Spatial
import With

class SizeTestingView: UIView {
   lazy var box: UIView = createBox()
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.backgroundColor = .purple
      _ = box
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Create
 */
extension SizeTestingView {
   /**
    * Title
    */
   func createBox() -> UIView {
      return with(.init()) {
         self.addSubview($0)
         $0.backgroundColor = UIColor.green.withAlphaComponent(0.5)
         $0.anchorAndSize(to: self, align: .topLeft, alignTo: .topLeft, offset: .init(x: 24, y: 24), sizeOffset: .init(width: -48, height: -48))//(to: self, width: size.width, align: .centerLeft, alignTo: .centerLeft, offset: .init(x: 20, y: 0) )
      }
   }
}
