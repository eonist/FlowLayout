#if os(OSX)
import Cocoa

extension NSImage {
   /**
    * creates cgimage from nsimage
    * - Important: ⚠️️ we use autoreleasepool{} or else there will be memory leakage
    */
   public var cgImage: CGImage? {
      return autoreleasepool {
         self.cgImage(forProposedRect: nil, context: nil, hints: nil)
      }
   }
   /**
    * Converts NSImage to CIImage
    */
   public var ciImage: CIImage? {
      guard let cgImg: CGImage = self.cgImage else { Swift.print("unable to convert to cgImage"); return nil }
      let ciImg: CoreImage.CIImage? = .init(cgImage: cgImg)
      return ciImg
   }
   /**
    * Resize NSImage
    * - Ref: https://stackoverflow.com/questions/11949250/how-to-resize-nsimage
    */
   public func resize(newSize: CGSize) -> NSImage {
      let destSize: CGSize = .init(width: newSize.width, height: newSize.height)
      let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(destSize.width), pixelsHigh: Int(destSize.height), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .calibratedRGB, bytesPerRow: 0, bitsPerPixel: 0)
      rep?.size = destSize
      NSGraphicsContext.saveGraphicsState()
      if let aRep = rep { NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: aRep) }
      self.draw(in: .init(origin: .zero, size: destSize), from: NSZeroRect, operation: NSCompositingOperation.copy, fraction: 1.0)
      NSGraphicsContext.restoreGraphicsState()
      let newImage: NSImage = .init(size: destSize)
      if let aRep = rep { newImage.addRepresentation(aRep) }
      return newImage
   }
}
/**
 * Inverts an image (black becomes white etc)
 */
//   func invertedImage() -> Image? {
//      guard let ciImage:CIImage = self.ciImage() else {Swift.print("UIImage.invertedImage() - unable to create ciImage"); return nil}//CoreImage.CIImage(cgImage: cgImage)
//      guard let cgImage:CGImage = ciImage.invertedImage() else {Swift.print("unable to create cgImage");return nil}
//      return Image(cgImage: cgImage)
//   }

/**
 * Creates UIImage for size and color
 */
//   static func createImage(size: CGSize, color:Color) -> Image {
//      return UIGraphicsImageRenderer(size: size).image { rendererContext in
//         color.setFill()
//         rendererContext.fill(CGRect(origin: .zero, size: size))
//      }
//   }
#endif
