import Foundation
/**
 * Makes the code more reusable/modular
 */
public protocol DecodingContainerTransformer {
   associatedtype DecodingInput
   associatedtype DecodingOutput
   func decode(input: DecodingInput) throws -> DecodingOutput
}
/**
 * Makes the code more reusable/modular
 */
extension KeyedDecodingContainer {
   /**
    * Fixme: ⚠️️ write doc
    */
   public func decode<Transformer: DecodingContainerTransformer>(key: Key, transformer: Transformer) throws -> Transformer.DecodingOutput where Transformer.DecodingInput: Decodable {
      return try transformer.decode(input: try decode(Transformer.DecodingInput.self, forKey: key))
   }
   /**
    * For optional?
    */
   public func decodeIfPresent<Transformer: DecodingContainerTransformer>(key: Key, transformer: Transformer) throws -> Transformer.DecodingOutput? where Transformer.DecodingInput: Decodable {
      return try decodeIfPresent(Transformer.DecodingInput.self, forKey: key).map(transformer.decode)
   }
}
