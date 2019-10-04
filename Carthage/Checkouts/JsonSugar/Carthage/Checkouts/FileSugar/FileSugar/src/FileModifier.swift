import Foundation

public class FileModifier {
   /**
    * - PARAM: fromURL: "/path/to/old"
    * - PARAM: toURL: "/path/to/new"
    * - Fixme: additional catch clauses:
    * catch NSCocoaError.FileNoSuchFileError {print("Error: no such file exists")
    * catch NSCocoaError.FileReadUnsupportedSchemeError {print("Error: unsupported scheme (should be 'file://')")}
    * - IMPORTANT: ⚠️️ paths must be created with: URL(fileURLWithPath: directory) and then .path
    * - IMPORTANT: ⚠️️ the toURL needs to have the name of the file as well.
    */
   public static func move(_ fromURL: String, toURL: String) {
      let fileManager = FileManager.default
      let fromURL: URL = .init(fileURLWithPath: fromURL)
      let toURL: URL = .init(fileURLWithPath: toURL)
      do {
         try fileManager.moveItem(at: fromURL, to: toURL)
      } catch let error as NSError {
         print("Error: \(error.domain)")
      }
   }
   /**
    * Copies a file to another location
    * IMPORTANT: ⚠️️ paths must be created with: URL(fileURLWithPath: directory) and then .path
    * IMPORTANT: ⚠️️ the toURL needs to have the name of the file as well.
    */
   public static func copy(_ fromURL: String, toURL: String) -> Bool {
      let fileManager = FileManager.default
      let fromURL: URL = .init(fileURLWithPath: fromURL)
      let toURL: URL = .init(fileURLWithPath: toURL)
      do {
         try fileManager.copyItem(at: fromURL, to: toURL)
         return true
      }
      catch let error as NSError {
         print("⚠️️ copy.Error: \(error)")
         return false
      }
   }
   /**
    * EXAMPLE: FileModifier.write("~/Desktop/del.txt".tildePath, "test")//returns true or false depending on if something was written or not
    * NOTE: this method over-writes data to files that already exists as well
    * NOTE: this method creates a new file if non exists before
    */
   public static func write(_ path: String, content: String) -> Bool {
      //        Swift.print("FileModifier.write")
      do {
         try content.write(toFile: path, atomically: true, encoding: .utf8)
         return true
      } catch {
         print("failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding")
         return false
      }
   }
   /**
    * EXAMPLE: FileModifier.write("~/Desktop/del.txt".tildePath, data)//returns true or false depending on if something was written or not
    */
   public static func write(path: String, data: Data) -> Bool {
      do {
         try data.write(to: URL(fileURLWithPath: path), options: [.atomic])
         return true
      } catch let error {
         print("failed to write file – bad permissions, bad filename, missing permissions, or something else error: \(error.localizedDescription)")
         return false
      }
   }
   /**
    * ## EXAMPLES: FileModifier.createDir("~/Desktop/temp/".tildePath)//returns true or false depending on if something was created or not
    * - NOTE: Also creates entire structures of folders say if non of the folders in path desktop/temp/tmp/blabla already exists, then all 3 folders will be created
    */
   public static func createDir(path: String) -> Bool {
      do {
         try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
         return true
      } catch let error {
         Swift.print("Unable to create directory \(error.localizedDescription)")
         return false
      }
   }
   /**
    * Deletes a file at PARAM: path
    */
   public static func delete(_ path: String) -> Bool {
      let fileManager = FileManager.default
      do {
         try fileManager.removeItem(atPath: path)
         return true
      }
      catch let error as NSError {
         print("delete.Error: \(error)")
         return false
      }
   }
   /**
    * Renames a file
    */
   public static func rename(_ fromURL: String, toURL: String) -> Bool {
      let fileManager = FileManager.default
      do {
         try fileManager.moveItem(atPath: fromURL, toPath: toURL)
         return true
      }catch let error as NSError {
         print("rename.Error: \(error)")
         return false
      }
   }
   /**
    * Creates a folder at PARAM path
    */
   public static func createFolder(_ path: String) -> Bool {
      let fileManager = FileManager.default
      do {
         try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
         return true
      }catch let error as NSError {
         print("createFolder.Error: \(error)")
         return false
      }
   }
   /**
    * Append text to file
    */
   public static func append(_ path: String, text: String) -> Bool {
      return append(path, text: text, index: text.lengthOfBytes(using: .utf8))
   }
   /**
    * Append text to file at index
    */
   public static func append(_ path: String, text: String, index: Int) -> Bool {
      guard let os = OutputStream(toFileAtPath: path, append: true) else { return false }
      os.open()
      os.write(text, maxLength: index)
      os.close()
      return true
   }
}
