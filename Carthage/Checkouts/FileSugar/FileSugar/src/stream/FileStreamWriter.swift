import Foundation

class FileStreamWriter {
	/**
    * Reads data from filepath
	 * - Note: https://stackoverflow.com/questions/37981375/nsfilehandle-updateatpath-how-can-i-update-file-instead-of-overwriting
	 * ## Examples:
	 *
    */
	static func write(filePath: String, data: Data, index: Int) -> Bool {
		//guard here
		let file: NSFileHandle? = NSFileHandle(forUpdatingAtPath: filepath1)
		if file == nil {
		    print("File open failed")
			 // var error:NSError?
			 do {
              try data.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
          } catch {
              print("Error creating \(filePath)")
				  return false
          }
			 return true
		} else {
		    let data = ("black dog" as NSString).dataUsingEncoding(NSUTF8StringEncoding)
		    file?.seekToFileOffset(index)
		    file?.writeData(data!)
		    file?.closeFile()
			 return true
		}
	}
	/**
    * Empties a file
    */
	static func clear(filePath: String) -> Bool {
		//guard here
		let file: NSFileHandle? = NSFileHandle(forUpdatingAtPath: filepath1)
		if file == nil {
			 print("File open failed")
			 return false
		} else {
			 file?.truncateFileAtOffset(0)
			 file?.closeFile()
			 return true
		}
	}
}
