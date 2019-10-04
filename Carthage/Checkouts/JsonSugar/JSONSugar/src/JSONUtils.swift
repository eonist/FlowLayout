import Foundation

public class JSONUtils {
   /**
    * Describer
    * - Abstract: traverses the json hierarchy and describes it
    */
   public static func describe(_ json: Any?) {
      if let str = JSONParser.str(json) {
         Swift.print("Str: \(str)")
      } else if let int = JSONParser.int(json) {
         Swift.print("Int: \(int)")
      } else if let dict = JSONParser.dict(json) {
         Swift.print("Dict.count: " + "\(dict.count)")
         dict.forEach { key, value in
            Swift.print("key: \(key)")
            describe(value)
         }
      } else if let arr = JSONParser.arr(json) {
         Swift.print("Arr.count: " + "\(arr.count)")
         arr.forEach { describe($0) }
      } else {
         fatalError("Type not supported: \(type(of: json)) type \(String(describing: JSONType.type(json)))")
      }
   }
}
