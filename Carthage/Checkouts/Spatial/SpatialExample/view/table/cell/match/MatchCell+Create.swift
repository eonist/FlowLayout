import UIKit
import Spatial
import With
/**
 * Create
 */
extension MatchCell {
   /**
    * Date
    */
   func createDateLabel() -> UILabel {
      return with(.init()) {
         $0.text = "date"
         $0.font = UIFont.boldSystemFont(ofSize: 16.0)
         $0.textColor = .black
         //         label.backgroundColor = .orange
         $0.textAlignment = .right
         self.contentView.addSubview($0)
         $0.backgroundColor = .red
         $0.anchorAndSize(to: self.contentView, width: 96, height: 32, align: .centerRight, alignTo: .centerRight, offset: .init(x: -Margin.horizontal, y: 0/*Margin.vertical*/) )
      }
   }
   /**
    * Creates TitleLabel
    */
   func createHomeTeamLabel() -> UILabel {
      return with(.init()) {
         $0.text = "title"
         $0.font = .boldSystemFont(ofSize: 20.0)
         $0.textColor = .black
         $0.textAlignment = .left
         self.contentView.addSubview($0)
         $0.backgroundColor = .blue
         $0.anchorAndSize(to: self.contentView, align: .bottomLeft, alignTo: .bottomLeft, multiplier: .init(width: 1, height: 0.5), offset: .init(x: Margin.horizontal, y: -Margin.vertical), sizeOffset: .init(width: -Margin.horizontal * 2, height: -Margin.vertical))
      }
   }
   /**
    * Title
    */
   func createAwayTeamLabel() -> UILabel {
      return with(.init()) {
         $0.text = "title"
         $0.font = .boldSystemFont(ofSize: 20.0)
         $0.textColor = .black
         $0.textAlignment = .left
         self.contentView.addSubview($0)
         $0.backgroundColor = .purple
         $0.anchorAndSize(to: self.contentView, align: .topLeft, alignTo: .topLeft, multiplier: .init(width: 1, height: 0.5), offset: .init(x: Margin.horizontal, y: Margin.vertical), sizeOffset: .init(width: -Margin.horizontal * 2, height: -Margin.vertical))
      }
   }
}
