import Foundation
/**
 * Fixme: ⚠️️ Investigate how to add bool, look in the api doc maybe?
 */
public enum JSONType {
   case arr
   case int
   case dict
   case dictArr /* An array of dictionaries */
   case str
}
extension JSONType {
   public static func type(_ json: Any?) -> JSONType? {
      switch true {
      case JSONAsserter.isStr(json): return .str
      case JSONAsserter.isInt(json): return .int
      case JSONAsserter.isDict(json): return .dict
      case JSONAsserter.isDictArr(json): return .dictArr
      case JSONAsserter.isArr(json): return .arr
      default:
         print("Type not supported: \(Swift.type(of: json))")
         return nil
      }
   }
}
