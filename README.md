<p align="center">
<img src="https://github.com/Dschee/HandyUIKit/blob/stable/Logo.png?raw=true"
width=600 height=167>
</p>

<p align="center">
<a href="https://www.bitrise.io/app/c77eb6063e52fe8e">
<img src="https://www.bitrise.io/app/c77eb6063e52fe8e.svg?token=OYicGI_yNhaQnpOsnVEypw&branch=stable"
alt="Build Status">
</a>
<a href="https://codebeat.co/projects/github-com-flinesoft-handyuikit">
<img src="https://codebeat.co/badges/283e545d-02e9-4fcf-aabc-40cacfbfe26c"
alt="codebeat badge">
</a>
<a href="https://github.com/Flinesoft/HandyUIKit/releases">
<img src="https://img.shields.io/badge/Version-1.0.0-blue.svg"
alt="Version: 1.0.0">
</a>
<img src="https://img.shields.io/badge/Swift-3.0-FFAC45.svg"
alt="Swift: 3.0">
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

### Carthage

Place one of the following lines to your Cartfile:

``` Swift
github "Flinesoft/HandyUIKit"
```

Now run `carthage update`. Then drag & drop the HandySwift.framework in the Carthage/build folder to your project. Now you can `import HandyUIKit` in each class you want to use its features. Refer to the [Carthage README](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) for detailed / updated instructions.

### CocoaPods

Add the line `pod 'HandySwift'` to your target in your `Podfile` and make sure to include `use_frameworks!`
at the top. The result might look similar to this:

``` Ruby
platform :ios, '8.0'
use_frameworks!

target 'MyAppTarget' do
  pod 'HandyUIKit', '~> 1.0'
end
```

Now close your project and run `pod install` from the command line. Then open the `.xcworkspace` from within your project folder.
Build your project once (with `Cmd+B`) to update the frameworks known to Xcode. Now you can `import HandyUIKit` in each class you want to use its features.
Refer to [CocoaPods.org](https://cocoapods.org) for detailed / updates instructions.

## Usage

Please have a look at the UsageExamples.playground for a complete list of features provided.
Open the Playground from within the `.xcworkspace` in order for it to work.

---
**Overview of all features provided:**

- **Extensions**
  - [UIColor](#uicolorextension)
  - [CoreGraphics](#coregraphicsextensions)

---

### UIColorExtension

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
rgbaColor.rgba.blue // => 0.3
let newRgbaColor = rgbaColor.change(.blue, by: 0.2)
newRgbaColor.rgba.blue // => 0.5
```

#### .change(ChangeableAttribute, to:)
Creates a new `UIColor` object with the value of a single attribute set to a given value.

``` Swift
hsbaColor.hsba.brightness // => 0.3
let newHsbaColor = hsbaColor.change(.brightness, to: 0.8)
newHsbaColor.hsba.brightness // => 0.8
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

## Contributing

Contributions are welcome. Please just open an Issue on GitHub to discuss a point or request a feature or send a Pull Request with your suggestion. If there's a related discussion on the Swift Evolution mailing list, please also post the thread name with a link.

Pull requests with new features will only be accepted when the following are given:
- The UI feature is **handy** but not (yet) part of UIKit.
- **Tests** for the new feature exist and all tests pass successfully.
- **Usage examples** of the new feature are given in the Playgrounds.

Please also try to follow the same syntax and semantic in your **commit messages** (see rationale [here](http://chris.beams.io/posts/git-commit/)).


## License
This library is released under the [MIT License](http://opensource.org/licenses/MIT). See LICENSE for details.
