import UIKit
/**
 * Core
 */
extension HorCell{
   /**
    * Override in sub class
    * - Note: This method exists so that we can subclass HorCell and register different child cell types
    * - Todo: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
    */
   @objc func registerCell(collectionView: UICollectionView) {
      collectionView.register(VerCell.self, forCellWithReuseIdentifier: VerCell.id)
   }
   /**
    * Override in sub class
    * - Note: This method exists so that we can subclass HorCell and register different child cell types
    * - Todo: ⚠️️ Replace this method with accociate type etc. See ref link in ViewController.swift
    */
   @objc func dequeCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell:VerCell = collectionView.dequeueReusableCell(withReuseIdentifier: VerCell.id, for: indexPath as IndexPath) as? VerCell else {fatalError("err")}
      return cell
   }
}
