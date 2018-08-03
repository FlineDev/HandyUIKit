<p align="center">
<img src="https://github.com/Dschee/HandyUIKit/blob/stable/Logo.png?raw=true"
width=600>
</p>

<p align="center">
<a href="https://app.bitrise.io/app/c77eb6063e52fe8e">
<img src="https://app.bitrise.io/app/c77eb6063e52fe8e/status.svg?token=OYicGI_yNhaQnpOsnVEypw&branch=stable"
alt="Build Status">
</a>
<a href="https://codebeat.co/projects/github-com-flinesoft-handyuikit">
<img src="https://codebeat.co/badges/01dd8c86-da28-4f46-9fb0-3aa38df2532a"
alt="codebeat badge">
</a>
<a href="https://github.com/Flinesoft/HandyUIKit/releases">
<img src="https://img.shields.io/badge/Version-1.7.3-blue.svg"
alt="Version: 1.7.3">
</a>
<img src="https://img.shields.io/badge/Swift-4.1-FFAC45.svg"
alt="Swift: 4.1">
<img src="https://img.shields.io/badge/Platforms-iOS%20%7C%20tvOS-FF69B4.svg"
alt="Platforms: iOS | tvOS">
<a href="https://github.com/Flinesoft/HandyUIKit/blob/stable/LICENSE.md">
<img src="https://img.shields.io/badge/License-MIT-lightgrey.svg"
alt="License: MIT">
</a>
</p>

<p align="center">
<a href="#installation">Installation</a>
• <a href="#usage">Usage</a>
• <a href="https://github.com/Flinesoft/HandyUIKit/issues">Issues</a>
• <a href="#contributing">Contributing</a>
• <a href="#license">License</a>
</p>


# HandyUIKit

The goal of this library is to provide **handy UI related features** that we feel like they should have been part of the UIKit frameworks themselves. Therefore this library is intended to inherit solutions for common tasks that appear in daily programming and tries to comply to the same naming conventions as already used in the Apple frameworks.

If you like this, please also checkout [HandySwift](https://github.com/Flinesoft/HandySwift) for handy features that didn't make it into the Swift standard library. It includes additions that are not UI related.

## Installation

Currently the recommended way of installing this library is via [Carthage](https://github.com/Carthage/Carthage).
[Cocoapods](https://github.com/CocoaPods/CocoaPods) is supported, too.

You can of course also just include this framework manually into your project by downloading it or by using git submodules.

*Note: This project is ready for Swift 4. Until Xcode 9 is officially released though, you need to use the branch "work/swift4".*

### Carthage

Place the following line to your Cartfile:

``` Swift
github "Flinesoft/HandyUIKit" ~> 1.6
```

Now run `carthage update`. Then drag & drop the HandyUIKit.framework in the Carthage/build folder to your project. Now you can `import HandyUIKit` in each class you want to use its features. Refer to the [Carthage README](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) for detailed / updated instructions.

### CocoaPods

Add the line `pod 'HandyUIKit'` to your target in your `Podfile` and make sure to include `use_frameworks!`
at the top. The result might look similar to this:

``` Ruby
platform :ios, '8.0'
use_frameworks!

target 'MyAppTarget' do
  pod 'HandyUIKit', '~> 1.6'
end
```

Now close your project and run `pod install` from the command line. Then open the `.xcworkspace` from within your project folder.
Build your project once (with `Cmd+B`) to update the frameworks known to Xcode. Now you can `import HandyUIKit` in each class you want to use its features.
Refer to [CocoaPods.org](https://cocoapods.org) for detailed / updates instructions.

## Usage

Please have a look at the UsageExamples.playground for a complete list of features provided.
Open the Playground from within the `.xcworkspace` in order for it to work.

---
#### Feature Overview

- **Extensions**
  - [UIColor](#uicolorextension)
  - [UIView](#uiviewextension)
  - [CoreGraphics](#coregraphicsextensions)
  - [StringExtension](#stringextension)
  - [UIImageExtension](#uiimageextension)

---

### UIColorExtension

> If you are using the RGB color system to define your colors, you definitely should checkout **[this great blog post](https://medium.com/@erikdkennedy/color-in-ui-design-a-practical-framework-e18cacd97f9e#.krfv78qsm)** on **why RGB is a bad choice** for most projects (not all, of course). And if you think you found the perfect way of changing the brightness of a color using the HSB system, you'll be proved wrong there, too. Honestly, it's worth a read. If you don't want though: "Luminance" is the keyword here and it is the single most important reason why HandyUIKit integrates **native support for the HLC** (or sometimes called LCh) color system to the `UIColor` class. HLC is a more human-understandable transformation of the LAB color space and shares its great advantage of having a single value that you need to change to **correctly change the perceived brightness** of any given color: The `luminance` value. And changing the brightness can save you a lot of time when working with colors in apps, as described in the blog post.

#### init(hue:luminance:chroma:)
Initializes a UIColor with given HLC (LCh) colors normed to ranges from 0 to 1.

``` Swift
let hlcaColor = UIColor(hue: 180/360, luminance: 30/100, chroma: 125/128, alpha: 1)
```

#### .hlca
Returns a tuple with named HLCA parameters for easy access.

``` Swift
hlcaColor.hlca.hue // => 0.5
hlcaColor.hlca.luminance // => 0.3
hlcaColor.hlca.chroma // => 0.97
hlcaColor.hlca.alpha // => 1.0
```

#### .rgba
Returns a tuple with named RGBA parameters for easy access.

``` Swift
let rgbaColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)
rgbaColor.rgba.red // => 0.1
rgbaColor.rgba.green // => 0.2
rgbaColor.rgba.blue // => 0.3
rgbaColor.rgba.alpha // => 0.4
```

#### .hsba
Returns a tuple with named HSBA parameters for easy access.

``` Swift
let hsbaColor = UIColor(hue: 0.1, saturation: 0.2, brightness: 0.3, alpha: 0.4)
hsbaColor.hsba.hue // => 0.1
hsbaColor.hsba.saturation // => 0.2
hsbaColor.hsba.brightness // => 0.3
hsbaColor.hsba.alpha // => 0.4
```


#### .change(ChangeableAttribute, by:)
Creates a new `UIColor` object with a single attribute changed by a given difference using addition.

``` Swift
color.rgba.blue // => 0.3
let newColor = color.change(.blue, by: 0.2)
newColor.rgba.blue // => 0.5
```

#### .change(ChangeableAttribute, to:)
Creates a new `UIColor` object with the value of a single attribute set to a given value.

``` Swift
color.hlca.luminance // => 0.3
let newColor = color.change(.luminance, to: 0.8)
newColor.hlca.luminance // => 0.8
```

### UIViewExtension

#### .toImage(size:)
Takes a screenshot of the UIView's content optionally resizing the result to a given size.

``` Swift
let view = UIView(frame: CGRect(width: 500, height: 500))
let subview = UIView(frame: CGRect(width: 200, height: 200))
view.addSubview(subview)

view.backgroundColor = .blue
subview.backgroundColor = .red

let fullSizeContent = view.toImage() // => <UIImage: width: 500, height: 500>
let downSizedContent = view.toImage(size: CGSize(width: 80, height: 80))
// => <UIImage: width: 80, height: 80>
```

#### .bindEdgesToSuperview()
Adds constraints to the subview so it always has the same size and position as the superview.

``` Swift
view.frame // => {x: 0, y: 0, w: 500, h: 500}
subview.frame // => {x: 150, y: 150, w: 200, h: 200}
subview.bindEdgesToSuperview()
view.layoutIfNeeded()
subview.frame // => {x: 0, y: 0, w: 500, h: 500}
```


### CoreGraphicsExtensions

#### CGSize.inPixels / CGSize.inPixels(screen:)
Returns a new CGSize object with the width and height converted to true pixels on screen.

``` Swift
let size = CGSize(width: 100, height: 50)
size.inPixels // test this with a Retina screen target
// => {w 200 h 100}
size.inPixels(UIScreen.screens.last!) // pass a different screen
// => {w 50 h 25}
```

#### CGPoint.inPixels / CGPoint.inPixels(screen:)
Returns a new CGPoint object with the x and y converted to true pixels on screen.

``` Swift
let point = CGPoint(x: 100, y: 50)
point.inPixels // test this with a Retina screen target
// => {x 200 y 100}
let someScreen = UIScreen.screens.last!
point.inPixels(someScreen) // pass a different screen
// => {x 50 y 25}
```

#### CGRect.inPixels / CGRect.inPixels(screen:)
Returns a new CGRect object with the origin and size converted to true pixels on screen.

``` Swift
let rect = CGRect(x: 10, y: 20, width: 100, height: 50)
rect.inPixels // test this with a Retina screen target
// => {x 20 y 40 w 200 h 100}
let someScreen = UIScreen.screens.last!
rect.inPixels(someScreen) // pass a different screen
// => {x 5 y 10 w 50 h 25}
```

#### CGRect.init(size:) / CGRect.init(width:height:)
Creates a new CGRect object from origin zero with given size.

``` Swift
let someSize = CGSize(width: 100, height: 50)

let originZeroRect1 = CGRect(size: someSize)
let originZeroRect2 = CGRect(width: 100, height: 50)
```


### StringExtension
#### .height(forFixedWidth:font:)
Calculates and returns the height needed to fit the text into a width-constrained rect.

``` Swift
let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

loremIpsum.height(forFixedWidth: 300, font: UIFont.systemFont(ofSize: 14, weight: UIFontWeightBold))
// => 183.77734375
```

#### .width(forFixedHeight:font:)
Calculates and returns the width needed to fit the text into a height-constrained rect.

``` Swift
loremIpsum.width(forFixedHeight: 21, font: UIFont.systemFont(ofSize: 12, weight: UIFontWeightUltraLight))
// => 2351.0390625
```

#### .hyphenated()
A hyphenated NSAttributedString with justified alignment and word wrapping line break mode.

``` Swift
loremIpsum.hyphenated() // => a justified & hyphenated NSAttributedString object
```

#### .superscripted(font:) / .subscripted(font:) / .superAndSubscripted(font:)
Superscript and/or subscript part of your strings with the structures `^{superscripted text}` and `_{subscripted text}`.

``` Swift
"x^{2}".superscripted(font: UIFont.systemFont(ofSize: 20, weight: .medium))
```
Result: x<sup>2</sup>

``` Swift
"CO_{2}".subscripted(font: UIFont.systemFont(ofSize: 20, weight: .medium))
```
Result: CO<sub>2</sub>

``` Swift
"_{20}Ca^{1,0}".superAndSubscripted(font: UIFont.systemFont(ofSize: 20, weight: .regular))
```
Result: <sub>20</sub>Ca<sup>1,0</sup>

### UIImageExtension
#### .toGrayscale()
Creates a grayscale version of the image.

``` Swift
let image = UIImage(named: "someImage")!
let grayscaleImage = image.toGrayscale()
```

## Contributing

Contributions are welcome. Please just open an Issue on GitHub to discuss a point or request a feature or send a Pull Request with your suggestion. If there's a related discussion on the Swift Evolution mailing list, please also post the thread name with a link.

Pull requests with new features will only be accepted when the following are given:
- The UI feature is **handy** but not (yet) part of UIKit.
- **Tests** for the new feature exist and all tests pass successfully.
- **Usage examples** of the new feature are given in the Playgrounds.

Please also try to follow the same syntax and semantic in your **commit messages** (see rationale [here](http://chris.beams.io/posts/git-commit/)).


## License
This library is released under the [MIT License](http://opensource.org/licenses/MIT). See LICENSE for details.
