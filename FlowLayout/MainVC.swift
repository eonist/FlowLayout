import UIKit
import FlowLayout_iOS
/**
 * FlowLayout
 * - Description: FlowLayout (Bi-directional layout framework) (Great for prototyping UX ideas and apps)
 * - Definition: bidirectional: functioning in two directions.
 * - TODO: ⚠️️ set the view, don't add to it, also set it as RootVC, like in weather, and reaname to VC 👈
 * - TODO: ⚠️️ ReUse cell: https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6
 * - TODO: ⚠️️ apple video on advance collection views: https://developer.apple.com/videos/play/wwdc2014/232/
 * - TODO: ⚠️️ mixed sizes in Collection: https://octodev.net/custom-collectionviewlayout/
 */
class MainVC :UIViewController{
   lazy var flowView:HorView = createCustomFlowView()//createFlowView()
   override var prefersStatusBarHidden:Bool {return true}/*hides statusbar*/
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView()
//      view.backgroundColor = .white
      _ = flowView
   }
}
class MainView:UIView{}

//Clean up comments ✅
//add with ✅
//Add Spatial ✅
//make it a programmatic APP ✅
//add disable to boilerplate stubs 
//convert to swift 4.2 ✅
//Make flowlayout a lib that is loaded into an app ✅
//Make it carthage compatible ✅
//Organize better ✅
//use caseiteratable on enum ✅
//add custom subclasses
   //add custom header class
   //add custom HorCollection, verCollection? 
//add style tuples to thing ✅
//Make a style tuple for FlowLayout? ✅
//Align the header better
//Align buttons with distribute ✅
//make the cell system non-generic to gain extension override functionality ✅
//use spatial to align things ✅
//use spatial shorthand ✅
//Add topology to readme.md
//Add theme example
//add and make Prefs button
//add better master / detail framework (see legacy project)
//add correct y-offset between vertical views when toggeling (maybe just force y= 0?)
//remove header as singleton ✅
//do research into that other cell managment system
//add json parsing to example
//add themepark to example 👈👈👈
//Add deeplinking
//add userdefaults
