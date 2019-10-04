import Foundation
/**
 * FileParser for iOS and macOs
 */
public class FileParser {
   /**
    * Data for URL
    */
   public static func data(url: URL) -> Data? {
      do {
         let content: Data = try .init(contentsOf: url)
         return content
      } catch {
         return nil
      }
   }
   /**
    * Data for filePath (String)
    * ## Examples:
    * guard let data: Data = FileParser.data(filePath: filePath) else { Swift.print("no content"); fatalError("no content") }
    */
   public static func data(filePath: String) -> Data? {
      do {
         let url: URL = .init(fileURLWithPath: filePath)
         let content: Data = try .init(contentsOf: url)
         return content
      } catch let error as NSError {
         Swift.print("Error: \(error)")
         return nil
      }
   }
   /**
    * Returns string content from a file at file location "path"
    * - Parameter path: is the file path to the file in this format: (User/John/Desktop/test.txt) aka absolute
    * - Important: ⚠️️ Remember to expand the path with the .tildePath call, if it's a tilde path
    * - Note: Supports syntax like this: /Users/John/Desktop/temp/../test.txt (the temp folder is excluded in this case)
    * ## Examples:
    * let path = "//Users/<path>/someFile.xml"
    * var err: NSError?
    * let content = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: &err)
    * ## Examples:
    * FileParser.content(dirPath: NSString(string: "~/Desktop/temp.txt").expandingTildeInPath)
    */
   public static func content(filePath path: String, encoding: String.Encoding = .utf8) -> String? {
      do {
         let content: String = try .init(contentsOfFile: path, encoding: encoding)
         return content
      } catch  let error as NSError {
         Swift.print("Error: \(error)")
         return nil
      }
   }
   /**
    * FileParser.resourceContent("example","txt")
    * ## Examples:
    * Swift.print(FileParser.content(FilePathParser.resourcePath() + "/temp.bundle/test.txt"))
    */
   public static func resourceContent(_ fileName: String, fileExtension: String) -> String? {
      guard let filepath: String = Bundle.main.path(forResource: fileName, ofType: fileExtension) else { return nil } // example.txt not found!
      return content(filePath: filepath)
   }
   /**
    * - Note: make sure the file exists with: FileAsserter.exists("some path here")
    * - Parameter filePath: Can't be tildePath, must be absolute Users/John/...
    * ## Examples:
    * let filePath: String = NSString(string: "~/Desktop/test.txt").expandingTildeInPath
    * let date: Date? = FileParser.modificationDate()
    */
   public static func modificationDate(_ filePath: String) -> NSDate? {
      let fileURL: NSURL = .init(fileURLWithPath: filePath)
      guard let attributes = try? fileURL.resourceValues(forKeys: [URLResourceKey.contentModificationDateKey, URLResourceKey.nameKey]) else { return nil }
      guard let modificationDate: NSDate = attributes[URLResourceKey.contentModificationDateKey] as? NSDate else { return nil }
      return modificationDate
   }
   /**
    * Returns paths of content in a dir
    * - Note: This is the root folder of the main Harddrive on your computer
    * ## Examples:
    * let filePath = NSString(string: "~/Desktop/").expandingTildeInPath
    * FileParser.content(dirPath: filePath)
    */
   public static func content(dirPath path: String) -> [String]? {
      let fileManager = FileManager.default
      do {
         let files = try fileManager.contentsOfDirectory(atPath: path)
         return files
      }catch let error as NSError {
         print("FileParser.content Error: \(error)")
         return nil
      }
   }
   /**
    * Returns temporary directory path
    */
   public static var tempPath: String {
      return NSTemporaryDirectory() as String
   }
   /**
    * Returns the current directory path
    *
    */
   public static var curDir: String {
      let fileManager = FileManager.default
      return fileManager.currentDirectoryPath
   }
}
#if os(OSX)
import Cocoa
/**
 * Fileparsing for mac only
 */
extension FileParser {
   /**
    * Returns an xml instance comprised of the string content at location PARAM: path
    * ## Examples:
    * xml("~/Desktop/assets/xml/table.xml".tildePath) // Output: XML instance
    * - Important: ⚠️️ Remember to expand the "path" with the tildePath call before you call xml(path)
    */
   public static func xml(_ path: String) -> XMLElement? {
      guard let content: String = FileParser.content(filePath: path) else { fatalError("Must have content: path: \(path)") }
      do {
         let xmlDoc: XMLDocument = try XMLDocument(xmlString: content, options: XMLNode.Options(rawValue: 0))
         return xmlDoc.rootElement()
      } catch let error as NSError {
         Swift.print("FileParser.xml Error: \(error.domain) path:\(path)")
         return nil
      }
   }
   /**
    * - Note: you have an extension for NSSavePanel in WinExtension: See NSSavePanel.initialize....
    */
   private static func modalExample() {
      let myFileDialog: NSOpenPanel = .init() // Open modal panel
      myFileDialog.runModal()
      let thePath = myFileDialog.url?.path // Get the path to the file chosen in the NSOpenPanel
      if let thePath = thePath, let theContent = FileParser.content(filePath: thePath) { // Make sure that a path was chosen
          Swift.print("theContent: " + "\(theContent)")
      }
   }
}
#endif
