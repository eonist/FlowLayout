import UIKit
import With
import Spatial
/**
 * A BrowserPage is contained within a BrowserView
 * - Note: This class is later subclassed as a generic class, and as such overriding things in extension doesn't work
 */
class HorCell:UICollectionViewCell {
   lazy var collectionView:UICollectionView = self.createCollectionView()/*Vertical*/
   var items:[Int] = [0,1,2,3,4,5,7,8,9]
   var count:Int {return items.count}/*override this in subclasses*/
   var onTableViewScrollCallBack:ScrollCallBack = {_ in Swift.print("StoryTableView - no callback attached")}
   var cellData:CellDataKind?
   /**
    * Initiate
    */
   override init(frame: CGRect) {
      items = [0,1,2,3,4,5,7,8,9]
      super.init(frame: frame)
      self.backgroundColor = .purple
      _ = collectionView/* inits the collectionView, works with empty data, before we get data from remote */
      //updateCollectionView()/*Updates the collection view with data */
   }
   /**
    * Boilerplate
    */
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Core
 */
extension HorCell{
   /**
    * Override in sub class
    * - Note: This method exists so that we can subclass HorCell and register different child cell types
    * - Todo: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
    */
   @objc func registerCell(collectionView:UICollectionView){
      collectionView.register(VerCell.self, forCellWithReuseIdentifier: VerCell.id)
   }
   /**
    * Override in sub class
    * - Note: This method exists so that we can subclass HorCell and register different child cell types
    * - Todo: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
    */
   @objc func dequeCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
      guard let cell:VerCell = collectionView.dequeueReusableCell(withReuseIdentifier: VerCell.id, for: indexPath as IndexPath) as? VerCell else {fatalError("err")}
      return cell
   }
}
/**
 * Const
 */
extension HorCell{
   @objc class var id:String {return "\(HorCell.self)"}/*Stores the deque cell id, overrideable in subclasses*/
}
