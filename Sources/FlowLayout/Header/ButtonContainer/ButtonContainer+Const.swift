import QuartzCore

extension ButtonContainer {
   static let defaultOnButtonTap: OnButtonTap = { _ in Swift.print("Callback is missing") }
   static let height: CGFloat = 60
}
