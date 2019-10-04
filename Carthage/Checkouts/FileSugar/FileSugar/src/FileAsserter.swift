import Foundation

public class FileAsserter {
    /**
     * Asserts if a file or folder exists
     * ## Examples:
     * FileAsserter.exists(path: NSString(string: "~/Desktop/del.txt").expandingTildeInPath) // true or false (remember to expand the tildePath)
     */
    public static func exists(path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    /**
     * Asserts if a file has content
     * ## Examples:
     * FileAsserter.hasContent(filePath: NSString(string: "~/Desktop/del.txt").expandingTildeInPath)
     */
    public static func hasContent(filePath: String) -> Bool {
        return FileParser.content(dirPath: filePath)?.isEmpty ?? false
    }
}
