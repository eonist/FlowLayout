import FileSugar
import XCTest

class FileSugarTests: XCTestCase {
   override func setUp() {
      super.setUp()
      _ = () // Put setup code here. This method is called before the invocation of each test method in the class.
   }
   override func tearDown() {
      super.tearDown()
       _ = () // Put teardown code here. This method is called after the invocation of each test method in the class.
   }
   func testExample() {
      let fileURL: URL? = CamUtil.tempURL(suffix: ".jpeg")
      XCTAssertNotNil(fileURL)
      XCTAssertFalse(FileManager().fileExists(atPath: fileURL!.path))
      //      XCTAssertEqual("Hello, World!", "Hello, World!")
   }
   func testPerformanceExample() {
      // This is an example of a performance test case.
      self.measure {
         // Put the code you want to measure the time of here.
      }
   }
}
