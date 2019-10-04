import Foundation

public struct TextCellData: CellDataKind {
   public let description: String
   public let content: String
   public init(description: String, content: String) {
      self.description = description
      self.content = content
   }
}
