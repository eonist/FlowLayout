import Cocoa

extension NSImageView {
   /**
    * Enables you to create an NSImage with 1 line
    * ## Examples:
    * NSImageView.init(image: image, size: image.size)
    */
   public convenience init(image: NSImage, size: CGSize, origin: CGPoint = .zero) {
      self.init(frame: .init(origin: origin, size: size))
      self.image = image
   }
   /**
    * Create NSImageView with one line
    * ## Examples:
    * guard let imageView: NSImageView = .init(filePath: filePath) else { fatalError("no content") }
    */
   public convenience init?(filePath: String, origin: CGPoint = .zero) {
      guard let img = NSImage.init(contentsOfFile: filePath) else { Swift.print("Couldnt load img"); return nil}
      self.init(frame: .init(origin: origin, size: img.size))
      self.image = img
   }
}
