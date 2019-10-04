import Foundation

/**
 * - Fixme: See TreeConverter.tree(json) for how you can convert json into data object you can more easily traverse, you can then do JSON -> Tree -> XML
 * - Fixme: ⚠️️ You can also look at the XML classes and reflection classes for how to make more json <-> convert methods
 * - Important. ⚠️️ See string extension "".json for json serilization from string and data
 */
public class JSONParser {
   /**
    * Array with any
    */
   public static func arr(_ json: Any?) -> [Any]? {
      return json as? [Any]
   }
   /**
    * Dict
    * ## Examples:
    * JSONParser.dict("{\"title\":\"doctor\"}".json)["title"] //Output: doctor
    * - Fixme: ⚠️️ use generics on this. See DictParser etc
    */
   public static func dict(_ json: Any?) -> [String: Any]? {
      return json as? [String: Any]
   }
   /**
    * Returns an Int if the json is of type Int
    */
   public static func int(_ json: Any?) -> Int? {
      return json as? Int
   }
   /**
    * Returns an String if the json is of type String
    */
   public static func str(_ json: Any?) -> String? {
      return json as? String
   }
   /**
    * Array of dictionaries
    * ## Examples:
    * JSONParser.dictArr("[{\"title\": \"doctor\"}]".json)?.forEach { print("\(JSONParser.dict($0)?["title"])") } //doctor
    */
   public static func dictArr(_ json: Any?) -> [[String: Any]]? {
      return json as? [[String: Any]]
   }
   /**
    * Converts json string to json object
    * ## Examples:
    * "{\"title\": \"doctor\"}".json //Output: a JSON object
    */
   public static func json(_ str: String) -> Any? {
      guard let data: Data = str.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
      if let json: Any = try? JSONSerialization.jsonObject(with: data, options: []) {
         return json
      }else {
         fatalError("JSON is format wrongly: \(str)")
      }
   }
   /**
    * Converts Dictionary to "JSON string"
    * - Note: the opposite of this is: let decoded = try JSONSerialization.jsonObject(with: jsonData, options: []);if let dictFromJSON = decoded as? [String:String] {}
    * - Note: If key is of type int, use recursion or reflection
    * ## Examples:
    * JSONParser.str(dict: ["2": "B", "1": "A", "3": ["1": true]])
    */
   public static func str<Key, Value>(dict: [Key: Value]) -> String? {
      do {
         let jsonData: Data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)// here "jsonData" is the dictionary encoded in JSON data
         return NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as String?
      } catch {
         print(error.localizedDescription)
         return nil
      }
   }
}
