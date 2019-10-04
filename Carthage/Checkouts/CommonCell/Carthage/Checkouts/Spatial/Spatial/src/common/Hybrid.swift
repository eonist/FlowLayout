/**
 * - Abstract: this class makes Spatial work for iOS and macOS
 */
#if os(iOS)
import UIKit
public typealias View = UIView
public typealias EdgeInsets = UIEdgeInsets
#elseif os(macOS)
import Cocoa
public typealias View = NSView
public typealias EdgeInsets = NSEdgeInsets
#endif

extension CGRect {
   /**
    * - Note: the insetBy is uniform like: NSRect.init(x: 0, y: 0, width: 100, height: 100).insetBy(dx: 10, dy: 10)//(10.0, 10.0, 80.0, 80.0)
    */
   public func inset(by inset: EdgeInsets) -> CGRect {
      let x = self.origin.x + inset.left
      let y = self.origin.y + inset.top
      let width = self.size.width - inset.left - inset.right
      let height = self.size.height - inset.top - inset.bottom
      return .init(x: x, y: y, width: width, height: height)
   }
}
