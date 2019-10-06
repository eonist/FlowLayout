# RefreshControl
A table refresh control

### Examples:
```swift
lazy var refresher = Refresher.init(onBeganRefreshing: refreshBegan, onEndedRefreshing: refreshEnded)
/**
 * Handler for refresh (Begin refreshing)
 */
func refreshBegan(){
   Swift.print("refreshBegan")
	self.header?.logo.progress(0) // reset
	self.header?.logo.startLoop()
   DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in // Simulates network delay
      self?.refresher.endRefreshing() // Start anim after N sec, but doesn't block the app
   }
}
/**
 * Handler for refresh (End refreshing)
 */
func refreshEnded() {
   Swift.print("refreshEnded")
   DispatchQueue.main.async { [weak self] in
      self?.header?.logo.stopLoop()
      self?.header?.logo.progress(0)
   }
}
/**
 * Used to make the NavBar stick to the tableView
 * - Note: calls a callback that notifies external UI elements to reposition etc
 */
func scrollViewDidScroll(_ scrollView: UIScrollView) {
	if self.contentOffset.y <= -100 && tableView.refresher.isRefreshing == false {
		self?.tableView.refresher.beginRefreshing()
	}
}

```
