# JSONSugar

json sugar for iOS and mac

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/jsonlib.svg">


### One-liner examples:

```swift
let strings: [String]? = try? "["a","b","c"]".data(using: .utf8)?.decode()
let strings: [String]? = try? "["a","b","c"]".decode()
let strings: [String]? = try? FileParser.data(filePath: filePath)?.decode() else { fatalError("Err") } // Remember to import FileSugar
```

### Basic example:

```swift
import JsonSugar

let jsonStr: String = """
{
    "name": "The Whale",
    "whaleType": "Blue Whale",
    "whaleInfo": {
        "size":"22",
        "color":"blue"
    }
}
"""
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

guard let jsonData = jsonStr.data(using: .utf8) else { fatalError("unable to convert string to data") }
guard let whale: Whale = try? decode(data: jsonData) else { fatalError("unable to decode whale") }

Swift.print("whale.name:  \(whale.name)") // The Whale
Swift.print("whale.whaleType:  \(whale.whaleType)") // Blue Whale
Swift.print("whale.whaleInfo.size:  \(whale.whaleInfo.size)") //  22
Swift.print("whale.whaleInfo.color:  \(whale.whaleInfo.color)") // blue

```

## Json-Array example:

```swift
import JsonSugar

let jsonStr = """
{
    "regions" : [
        {"language":"English", "artist":"Beyonce", "album":"Lemonade"},
        {"language":"Portuguese", "artist":"Enrique Iglesias", "album":"Escape"},
        {"language":"Spanish", "artist":"Shakira", "album":"Magia"}
    ]
}
"""
guard let jsonData = jsonStr.data(using: .utf8) else { fatalError("unable to convert string to data") }
do {
   guard let featuredData: FeaturedData = try decode(data: jsonData) else { fatalError("unable to decode json") }//From json to struct {
    featuredData.regions.forEach {
        Swift.print("$0.album:  \($0.album)")// Lemonade, Escape, Magia
    }
} catch let jsonErr {
    print("Error serializing json", jsonErr)
}
/**
 * Data structure
 * ## Examples:
 * let region1: Region = .init(language: English", artist:"Beyonce", album:"Lemonade"))
 * let region2: Region = .init(language: Spanish", artist:"Shakira", album:"Magia"))
 * let featured: Featured = .init(regions: [region1, region2])
 */
struct FeaturedData : Codable{
    struct Region : Codable {
        let language: String
        let artist: String
        let album: String
    }
    let regions: [Region]
}
```

### Simple array:
```swift
let jsonStr = """
[
    {"language":"English", "artist":"Beyonce", "album":"Lemonade"},
    {"language":"Portuguese", "artist":"Enrique Iglesias", "album":"Escape"},
    {"language":"Spanish", "artist":"Shakira", "album":"Magia"}
]
"""
guard let jsonData = jsonStr.data(using: .utf8) else { fatalError("unable to convert string to data") }
do {
   guard let regions: [Region] = try decode(data: jsonData) else { fatalError("unable to decode json") }//From json to struct {
    regions.forEach {
        Swift.print("$0.album:  \($0.album)")// Lemonade, Escape, Magia
    }
} catch let jsonErr {
    print("Error serializing json", jsonErr)
}
struct Region : Codable {
    let language: String
    let artist: String
    let album: String
}
```

### Todo:
- Add basic example ✅
- Use programatic app code
- Make macOS example
- Add Network example (in another project and then link to it)
- Add topology map
- Add transformer example
