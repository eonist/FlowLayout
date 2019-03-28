import Foundation

extension Button{
   open override func layoutSubviews() {
      self.layer.cornerRadius = self.style.isRounded ? self.frame.height/2 : 0
   }
}
