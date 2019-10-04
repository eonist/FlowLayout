import Foundation

class FileStreamReader {
	/**
    * Reads data from filepath
	 * ## Examples:
	 *
    */
	static func read(filePath: String, startIndex: Int, endIndex: Int) -> Data? {
		let file: NSFileHandle? = NSFileHandle(forReadingAtPath: filepath1)
		if file == nil {
			 Swift.print("File open failed")
			 return nil
		} else {
			 file?.seekToFileOffset(startIndex)
			 let databuffer = file?.readDataOfLength(endIndex)
			 file?.closeFile()
			 return databuffer
		}
	}
}
