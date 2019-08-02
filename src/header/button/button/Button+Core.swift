import Foundation

extension Button {
   override open func layoutSubviews() {
      self.layer.cornerRadius = self.style.isRounded ? self.frame.height / 2 : 0
   }
}
