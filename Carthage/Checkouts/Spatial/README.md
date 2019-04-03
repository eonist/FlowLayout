# Spatial
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![platform](https://img.shields.io/badge/Platform-macOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![codebeat badge](https://codebeat.co/badges/b4ee0d27-b00c-464b-b9b2-c9906cb6c19f)](https://codebeat.co/projects/github-com-eonist-spatial-master)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<img width="900" alt="img" src="https://rawgit.com/stylekit/img/master/spatial_github.svg">

Definition: **Spatial** | ˈspeɪʃ(ə)l | adjective | **describes how objects fit together in space**

### What is it
Hassle-free AutoLayout, tailored for interactivity and animation.

### How does it work
- Spatial is just extensions and enums which enable you to write less boilerplate code
- Spatial is interchangeable with Vanilla AutoLayout
- Spatial comes with examples how you can animate with AutoLayout
- Spatial uses plain and simple math under the hood.

### How do I get it
- Carthage `github "eonist/Spatial" "master"`
- Manual Open `Spatial.xcodeproj`
- CocoaPod (Coming soon)

### Example:

```swift
/*One-liner, single*/
btn1.anchorAndSize(to: self, width: 96, height: 24)

/*Long-hand, single*/
btn1.activateAnchorAndSize{ view in
	let a = Constraint.anchor(view, to: self)
	let s = Constraint.size(view, width:96, height:24)
	return (a,s)
}
```

```swift
/*Short-hand, bulk*/
[btn1,btn2,btn3].distributeAndSize(dir:.vertical, width:96, height:24)

/*Long-hand, bulk*/
[btn1,btn2,btn3].activateAnchorsAndSizes { views in
   let anchors = Constraint.distribute(vertically: views, align: .topLeft)
   let sizes = views.map{$0.size(width:96,height:42)}
   return (anchors, sizes)
}
```


```swift
/*Animation*/
btn.animate(to:100,align:left,alignTo:.left)
```
### Todo:
- Complete the spaceAround and spaceBetween methods ✅
- Add macOS support ✅
- Make examples with AutoLayout margins not
- Add methods for applyAnchor for horizontal and vertical types
- Document every param in every declaration (Since the API is more stable now) 👈
- Consider renaming anchor and size to pin and fit
