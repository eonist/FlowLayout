import UIKit

class CustomTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
   let rowData: [String]
   /*Init*/
   init(rowData: [String], frame: CGRect, style: UITableView.Style) {
      self.rowData = rowData
      super.init(frame: frame, style: style)
      registerCells()/*Registers Cell types*/
      self.dataSource = self
      self.delegate = self
      self.separatorStyle = .none
      self.backgroundColor = .lightGray
      self.backgroundView?.backgroundColor = .gray
      self.sectionHeaderHeight = 0
      self.sectionFooterHeight = 0
      self.tableHeaderView = .init(frame: .init(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
      self.tableFooterView = .init(frame: .init(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
