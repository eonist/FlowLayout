import XCTest
import UIKit
import NetworkSugar

class NetworkSugarUnitTest: XCTestCase {
   override func setUp() {
      super.setUp()
      _ = {}()
      // Put setup code here. This method is called before the invocation of each test method in the class.
   }
   override func tearDown() {
      super.tearDown()
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      _ = {}()
   }
   func testExample() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct results.
      let webPath: String = "https://github.com/stylekit/img/blob/master/playlist.json?raw=true"
      NetworkParser.str(urlStr: webPath) { let str: String? = try? $0.get(); print(str ?? ""); XCTAssertEqual(str?.count, 195) } // the json payload } // you can use .map() instead of get as we
   }
   func testPerformanceExample() {
      // This is an example of a performance test case.
      self.measure {
         // Put the code you want to measure the time of here.
      }
   }
}
