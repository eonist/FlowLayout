import UIKit
import With
import Spatial
/**
 * A BrowserPage is contained within a BrowserView
 * - Note: This class is later subclassed as a generic class, and as such overriding things in extension doesn't work
 */
class HorCell:UICollectionViewCell {
   class var id:String {return "\(HorCell.self)"}/*Stores the deque cell id, overrideable in subclasses*/
   lazy var collectionView:UICollectionView = self.createCollectionView()
   var items:[Int] = [0,1,2,3,4,5,7,8,9]
   var count:Int {return items.count}/*override this in subclasses*/
   var onTableViewScrollCallBack:ScrollCallBack = {_ in Swift.print("StoryTableView - no callback attached")}
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
   /**
    * Override in sub class
    * - Note: This method exists so that we can subclass HorCell and register different child cell types
    * - Todo: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
    */
   func registerCell(collectionView:UICollectionView){
      collectionView.register(VerCell.self, forCellWithReuseIdentifier: VerCell.id)
   }
   /**
    * Override in sub class
    * - Note: This method exists so that we can subclass HorCell and register different child cell types
    * - Todo: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
    */
   func dequeCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
      guard let cell:VerCell = collectionView.dequeueReusableCell(withReuseIdentifier: VerCell.id, for: indexPath as IndexPath) as? VerCell else {fatalError("err")}
      return cell
   }
   /**
    * Creates collectionview
    * - TODO: ⚠️️ replace UIEdgeInsetsMake with .init
    */
   func createCollectionView() -> UICollectionView{
      let layout:UICollectionViewFlowLayout = createLayout()
      return with(.init(frame: self.frame, collectionViewLayout: layout)) {
         $0.dataSource = self/*We must set datasource because the framework is view based not VC based*/
         $0.delegate = self/*We must set delegate because the framework is view based not VC based*/
         $0.contentInset = UIEdgeInsets.init(top: Header.height, left: 0, bottom: 0, right: 0)/*offsets the content, so that sticky header works etc*/
         $0.scrollIndicatorInsets = UIEdgeInsets.init(top: Header.height, left: 0, bottom: 0, right: 0)
         self.registerCell(collectionView:$0)/*Register cell kind*/
         $0.backgroundColor = .clear/*The HorCell it self also has a bg so we set this to clear*/
         self.addSubview($0)
         /*⚠️️ We have to use a constraint or else the double UICollection setup starts to behave strangly ⚠️️*/
         $0.activateConstraints{ view in/*The view needs to use constraints or else AutoLayout wont work with dual UICollectionView*/
            let anchor = Constraint.anchor(view, to: self, align: .topLeft, alignTo: .topLeft)
            let size = Constraint.size(view, size: CGSize.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/*-Header.height*/ ))
            return [anchor.x,anchor.y,size.w,size.h]
         }
      }
   }
}
