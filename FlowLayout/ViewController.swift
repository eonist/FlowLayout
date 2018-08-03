import UIKit

//create a menu button, that opens settings, VC style 🚫
//figure out aligning 🚫
//animate the activeation of buttons 👈
//make title bigger so it fits on iphonex 👈
//Create gif, readme and upload to github ✅
//also add one Vertical collection that only has 1 column 👈
//and fake refresh progress wheel 👈
    //figure out how to place the refresh wheel in the header
    //hide title when refreshing

//get rid of dequeCell etc. just override the objc method i guess. then you get rid of the baseclass too   👈

//add stock image
    //find stock images ✅
    //add the code that can load an image inside a circle mask
    //load the images from remote github url
        //requires WebService code


//upload to github
    //DualFlow 🚫
    //Add the readme from iphone ✅
    //Convert the onehanded vid to gif ✅

/**
 * Rename to TabbedSlideShow...
 * Description: FlowLayout (Unidirectional layout framework) (Great for prototyping UX ideas and apps)
 * TODO: ⚠️️ set the view, dont add to it
 * also set it as RootVC, like in weather, and reaname to VC 👈
 * TODO: ⚠️️ ReUse cell: https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6
 * TODO: ⚠️️ apple video on advance collection views: https://developer.apple.com/videos/play/wwdc2014/232/
 */
class ViewController: UIViewController {
    lazy var flowView = createFlowView()
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = flowView
    }
    override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
}
