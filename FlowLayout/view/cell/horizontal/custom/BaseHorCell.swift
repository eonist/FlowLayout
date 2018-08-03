import UIKit

/**
 * We need a Base class or else putting delegate methods in extensions wont build. Because generics + objc etc etc
 */
class BaseHorCell<T:CellDataKind>:HorCell{
    /**
     * When you set the data different UI's are updated
     */
    var data: T? {
        didSet{
            guard let data = data else {fatalError("data not avaiable")}
            /*⚠️️ set data to ui ⚠️️*/
            //            Swift.print("data.thumbURL:  \(data.thumbURL)")
            //            if let thumbURL = data.thumbURL {
            //                imgView.setImage(webPath: thumbURL) //"https://rawgit.com/stylekit/img/master/" + "pic_1_thumb.png"
            //                self.imgView.letterLabel.text = ""
            //            }else {
            //                //if imgView.image == nil {imgView.image}
            //                //imgView.setImage(webPath: "https://rawgit.com/stylekit/img/master/pic_1_thumb.png") //
            //                self.imgView.image = nil
            //                self.imgView.setNeedsDisplay()
            //                self.imgView.letterLabel.text = data.title.count > 0 ? String(data.title.first!) : ""
            //            }/*else set letter img etc*/
            //            titleLabel.text = data.title
        }
    }
}
