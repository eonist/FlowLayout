import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    /**
     * Creates the view
     */
    lazy var view: NSView = {
        let contentRect = window.contentRect(forFrameRect: window.frame)/*size of win sans titlebar*/
        let view: View = .init(frame: contentRect)
        window.contentView = view
        view.layer?.backgroundColor = NSColor.white.cgColor
        return view
    }()
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        _ = view
    }
}
