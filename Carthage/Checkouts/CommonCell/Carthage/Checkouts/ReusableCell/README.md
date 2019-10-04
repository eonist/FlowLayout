[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)

# ReusableCell
- Makes dequeuing cells simpler
- Works for TableView and CollectionView

### Example:

```swift
tableView.register(CustomCell.self) // Register Cells with ease
extension CustomCell: ReusableCell {} // Make your custom cells
let cell = tableView.dequeueReusableCell(for: indexPath) // Instantiate your cells
```

### Install:
- Carthage: `github "eonist/ReusableCell" "master"`
- Manual: Open `ReusableCellExample.xcodeproj`
- CocoaPod (Coming soon)  
