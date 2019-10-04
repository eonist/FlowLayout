[![](https://img.shields.io/badge/Protected_by-Hound-a873d1.svg)](https://houndci.com) [![codebeat badge](https://codebeat.co/badges/44f0bbfc-c9ce-4493-9362-2c742dde63df)](https://codebeat.co/projects/github-com-eonist-networksugar-master) [![Build Status](https://travis-ci.com/eonist/NetworkSugar.svg?branch=master)](https://travis-ci.com/eonist/NetworkSugar)

# Network sugar
Sugar that makes swift networking less cumbersome

## Example:

```swift
let urlStr: String = "https://github.com/stylekit/img/blob/master/playlist.json?raw=true"
//Longhand:
NetworkParser.str(urlStr: urlStr) { result in
  if case .success(let string) = result {
     Swift.print("str:  \(str)")
  } else if case .failure(let error) = result {
     Swift.print("error:  \(String(describing: error))")
  }
}
// Shorthand:
NetworkParser.str(urlStr: webPath) { print(try? $0.get()) } // the json payload
```
