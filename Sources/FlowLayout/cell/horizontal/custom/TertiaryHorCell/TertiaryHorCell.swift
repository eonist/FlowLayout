#if os(iOS)
import UIKit

final class TertiaryHorCell: HorCell {
   override init(frame: CGRect) {
      super.init(frame: frame)
   }
}
/**
 * Const
 */
extension TertiaryHorCell {
   @objc override class var id: String { "\(TertiaryHorCell.self)" }
}

#endif
