import Foundation

extension ButtonContainer{
   /**
    * Set index
    */
   func setIdx(idx:Int){
      Swift.print("BtnContainer.setIdx(idx)")
      let btnTitle:String? = HorView.CellType.allCases[idx].rawValue
      Swift.print("btnTitle:  \(String(describing: btnTitle))")
      buttons.forEach{//⚠️️ use filter instead
         if $0.titleLabel?.text == btnTitle {
            setActive(btn:$0)
         }
      }
   }
   /**
    * Set active state
    */
   func setActive(btn:UIButton){
      Swift.print("setActive:  \(setActive)")
      buttons.forEach{
         if $0 == btn {//⚠️️ use filter instead
            $0.setActive(isActive: true)
         }else{
            $0.setActive(isActive: false)
         }
      }
   }
}

