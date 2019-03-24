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
            _ = data
            /*⚠️️ set data to ui bellow ⚠️️*/
        }
    }
}
