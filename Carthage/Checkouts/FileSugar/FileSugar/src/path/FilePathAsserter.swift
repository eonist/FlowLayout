import Foundation

public class FilePathAsserter {
    /**
     * Tests if a path is absolute /User/John/ or relative : ../../ or styles/design/
     */
    public static func isAbsolute(_ path: String, pathSeperator: String = "/") -> Bool {
        return path.hasPrefix(pathSeperator)
    }
    /**
     * Fixme: ⚠️️ the name is not great, improve later, rename to atleast hasBacklash
     */
    public static func isBacklash(_ path: String) -> Bool {
        return path.hasPrefix("../")
    }
    /**
     * - Note: naive approach
     */
    public static func isFilePath(_ path: String, pathSeperator: String = "/") -> Bool {
        return path.hasPrefix(pathSeperator) || path.hasPrefix(".." + pathSeperator)
    }
    /**
     * Asserts if a path is a type of tilde path
     */
    public static func isTildePath(_ path: String) -> Bool {
        return path.hasPrefix("~")
    }
}
