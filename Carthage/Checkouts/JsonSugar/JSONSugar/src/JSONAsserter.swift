import Foundation

public class JSONAsserter {
   /**
    * Asserts if a a json is a dictionary
    */
   static func isDict(_ json: Any?) -> Bool {
      return JSONParser.dict(json) != nil
   }
   /**
    * Asserts if a a json is an Array
    */
   static func isArr(_ json: Any?) -> Bool {
      return JSONParser.arr(json) != nil
   }
   /**
    * Asserts if a a json is an array of dictioaries
    */
   static func isDictArr(_ json: Any?) -> Bool {
      return JSONParser.dictArr(json) != nil
   }
   /**
    * Asserts if a json is a string
    */
   static func isStr(_ json: Any?) -> Bool {
      return JSONParser.str(json) != nil
   }
   /**
    * Asserts if a json is an int
    */
   static func isInt(_ json: Any?) -> Bool {
      return JSONParser.int(json) != nil
   }
}
