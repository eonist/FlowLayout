import Foundation

public class FileAsserter {
    /**
     * - Note: Also works for folders
     * ## Examples:
     * FileAsserter.exists(path: NSString(string: "~/Desktop/del.txt").expandingTildeInPath)//true or false (remember to expand the tildePath)
     */
    public static func exists(path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    /**
     * Asserts if
     * ## Examples:
     * FileAsserter.hasContent(filePath: NSString(string: "~/Desktop/del.txt").expandingTildeInPath)
     */
    public static func hasContent(filePath: String) -> Bool {
        if let content: [String] = FileParser.content(dirPath: filePath) {
            return !content.isEmpty
        } else {
            return false
        }
    }
}
