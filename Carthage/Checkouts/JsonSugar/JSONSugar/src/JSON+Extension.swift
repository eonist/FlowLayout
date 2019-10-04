import Foundation
/**
 * Global generic decode method for Decodable
 * ## Examples:
 * let jsonStr: String = "["a","b","c"]"
 * guard let jsonData = jsonStr.data(using: .utf8) else { fatalError("unable to convert string to data") }
 * guard let strings: [String] = try? decode(data: jsonData) else { fatalError("unable to decode jsonData") }
 */
public func decode<T: Decodable>(data: Data) throws -> T {
   let decoder = JSONDecoder()
   return try decoder.decode(T.self, from: data)
}
/**
 * Encodable Extension
 */
extension Encodable {
   /**
    * Fixme: ⚠️️ write example
    */
   public func encode() throws -> Data {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted
      return try encoder.encode(self)
   }
}
