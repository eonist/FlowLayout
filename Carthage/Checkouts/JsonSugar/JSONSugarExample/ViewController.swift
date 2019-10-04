import UIKit
import JSONSugar
/**
 * - Fixme: ⚠️️ Move this into a Unit test
 */
class MainVC: UIViewController {
    let jsonStr = """
        {
            "name": "The Whale",
            "whaleType": "Blue Whale",
            "whaleInfo": {
                "size":"22",
                "color":"blue"
            }
        }
        """
    let jsonStr2 = """
        {
            "regions" : [
                {"language":"English", "artist":"Beyonce", "album":"Lemonade"},
                {"language":"Portuguese", "artist":"Enrique Iglesias", "album":"Escape"},
                {"language":"Spanish", "artist":"Shakira", "album":"Magia"}
            ]
        }
        """
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        test1()
        test2()
    }
}
/**
 * Data structure
 */
struct Whale: Decodable {
    struct WhaleInfo: Decodable {
        let size: String
        let color: String
    }
    let name: String
    let whaleType: String
    let whaleInfo: WhaleInfo
}
/**
 * Data structure
 * ## Examples:
 * let region1: Region = .init(language: English", artist:"Beyonce", album:"Lemonade"))
 * let region2: Region = .init(language: Spanish", artist:"Shakira", album:"Magia"))
 * let featured: Featured = .init(regions: [region1,region2])
 */
struct FeaturedData: Codable {
    struct Region: Codable {
        let language: String
        let artist: String
        let album: String
    }
    let regions: [Region]
}

/**
 * tests
 */
extension MainVC {
    /**
     * Testing parsing simple json
     */
    func test1() {
        guard let jsonData = jsonStr.data(using: .utf8) else { fatalError("unable to convert string to data") }
        guard let whale: Whale = try? decode(data: jsonData) else { fatalError("unable to decode whale") }//From json to struct {
        Swift.print("whale.name:  \(whale.name)") // The Whale
        Swift.print("whale.whaleType:  \(whale.whaleType)") // Blue Whale
        Swift.print("whale.whaleInfo.size:  \(whale.whaleInfo.size)") //  22
        Swift.print("whale.whaleInfo.color:  \(whale.whaleInfo.color)") // blue
    }
    /**
     * Testing parsing json array
     */
    func test2() {
        guard let jsonData = jsonStr2.data(using: .utf8) else { fatalError("unable to convert string to data") }
        do {
            guard let featuredData: FeaturedData = try decode(data: jsonData) else { fatalError("unable to decode whale") }//From json to struct {
            featuredData.regions.forEach {
                Swift.print("$0.album:  \($0.album)")// Lemonade, Escape, Magia
            }
        } catch let jsonErr {
            print("Error serializing json", jsonErr)
        }
    }
}
