import UIKit
import With
///
/// Create
///
extension TextCell {
   ///
   /// Create Title Label
   ///
   @objc open func createDescriptionLabel() -> UILabel {
      return with(.init()) {
         $0.text = "title"
         $0.textColor = .white // .black
         $0.backgroundColor = .clear
         $0.font = .boldSystemFont(ofSize: 16) // .boldSystemFont(ofSize: 20.0)
         $0.textAlignment = .left
         self.addSubview($0)
         // Constraints
         $0.translatesAutoresizingMaskIntoConstraints = false
         let left = $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Margin.horizontal)
         let y = $0.centerYAnchor.constraint(equalTo: self.centerYAnchor)
         NSLayoutConstraint.activate([left, y])
         $0.setContentHuggingPriority(.init(500), for: .horizontal) // Makes sure the label retians it's instrinsic width, as oppose to sticking to the textField left anchor
      }
   }
   ///
   /// Create Content TextField
   ///
   @objc open func createContentTextField() -> UITextField {
      return with(.init()) {
         $0.isUserInteractionEnabled = false
         $0.textAlignment = .right
         $0.textColor = .gray
         $0.tintColor = #colorLiteral(red: 0, green: 1, blue: 1, alpha: 1) // .cyan
         $0.font = .systemFont(ofSize: 16)
         self.addSubview($0)
         // Constraints
         configContentTextFieldConstraints($0)
      }
   }
}
///
/// Constraints
///
extension TextCell {
   ///
   /// - Description: Configure contentTextField constraints
   ///
   @objc open func configContentTextFieldConstraints(_ tf: UITextField) {
      with(tf) {
         $0.translatesAutoresizingMaskIntoConstraints = false
         let y = tf.centerYAnchor.constraint(equalTo: self.centerYAnchor)
         let left = $0.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: Margin.horizontal)
         left.priority = .init(rawValue: 251)
         let right = $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Margin.horizontal)
         NSLayoutConstraint.activate([left, right, y])
         $0.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 250), for: .horizontal) // Makes sure the content doesnt overlap the label
      }
   }
}
