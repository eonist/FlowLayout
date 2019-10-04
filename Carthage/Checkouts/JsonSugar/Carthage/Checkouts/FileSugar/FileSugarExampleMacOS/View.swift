import Cocoa
import FileSugar_macOS

open class View: NSView {
    override open var isFlipped: Bool { return true } /* TopLeft orientation */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        Swift.print("hello world")
        test1()
        self.wantsLayer = true /* if true then view is layer backed */
    }
    /**
     * Boilerplate
     */
    @available(*, unavailable)
    public required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension View {
    /**
     * Testing getting content from folder
     */
    func test1() {
        let result = FileParser.content(dirPath: NSString(string: "~/Desktop/").expandingTildeInPath)
//        Swift.print("result:  \(String(describing: result))")
        Swift.print("result.count:  \(result?.count)")
        result?.forEach {
            Swift.print("$0:  \($0)") // prints all the files on the desktop folder
        }
    }
}
