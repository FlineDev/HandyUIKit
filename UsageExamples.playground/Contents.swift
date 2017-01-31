import UIKit
import HandyUIKit
import PlaygroundSupport

//: ## UIColorExtension
//: ### init(hue:luminance:chroma:)
//: Initializes a UIColor with given HLC (LCh) colors normed to ranges from 0 to 1.

let hlcaColor = UIColor(hue: 180/360, luminance: 30/100, chroma: 125/128, alpha: 1)

//: ### .hlca
//: Returns a tuple with named HLCA parameters for easy access.

hlcaColor.hlca.hue
hlcaColor.hlca.luminance
hlcaColor.hlca.chroma
hlcaColor.hlca.alpha

//: ### .rgba
//: Returns a tuple with named RGBA parameters for easy access.

let rgbaColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)
rgbaColor.rgba.red
rgbaColor.rgba.green
rgbaColor.rgba.blue
rgbaColor.rgba.alpha

//: ### .hsba
//: Returns a tuple with named HSBA parameters for easy access.

let hsbaColor = UIColor(hue: 0.1, saturation: 0.2, brightness: 0.3, alpha: 0.4)
hsbaColor.hsba.hue
hsbaColor.hsba.saturation
hsbaColor.hsba.brightness
hsbaColor.hsba.alpha

//: ### .change(ChangeableAttribute, by:)
//: Creates a new `UIColor` object with a single attribute changed by a given difference using addition.

hlcaColor.hlca.luminance
let newHlcaColor = hlcaColor.change(.luminance, by: 0.5)
newHlcaColor.hlca.luminance

rgbaColor.rgba.blue
let newRgbaColor = rgbaColor.change(.blue, by: 0.2)
newRgbaColor.rgba.blue

//: ### .change(ChangeableAttribute, to:)
//: Creates a new `UIColor` object with the value of a single attribute set to a given value.

hsbaColor.hsba.brightness
let newHsbaColor = hsbaColor.change(.brightness, to: 0.8)
newHsbaColor.hsba.brightness


//: ## UIViewExtension
//: ### toImage(size:)
//: Takes a screenshot of the UIView's content optionally resizing the result to a given size.

let view = UIView(frame: CGRect(width: 500, height: 500))
let subview = UIView(frame: CGRect(width: 200, height: 200))
view.addSubview(subview)

view.backgroundColor = .blue
subview.backgroundColor = .red

let fullSizeContent = view.toImage()
let downSizedContent = view.toImage(size: CGSize(width: 50, height: 50))


//: ## CoreGraphicsExtensions
//: ### CGSize.inPixels / CGSize.inPixels(screen:)
//: Returns a new CGSize object with the width and height converted to true pixels on screen.

let size = CGSize(width: 100, height: 50)
size.inPixels // test this with a Retina screen target
size.inPixels(UIScreen.screens.last!) // pass a different screen

//: ### CGPoint.inPixels / CGPoint.inPixels(screen:)
//: Returns a new CGPoint object with the x and y converted to true pixels on screen.

let point = CGPoint(x: 100, y: 50)
point.inPixels // test this with a Retina screen target
point.inPixels(UIScreen.screens.last!) // pass a different screen

//: ### CGRect.inPixels / CGRect.inPixels(screen:)
//: Returns a new CGRect object with the origin and size converted to true pixels on screen.

let rect = CGRect(x: 10, y: 20, width: 100, height: 50)
rect.inPixels // test this with a Retina screen target
rect.inPixels(UIScreen.screens.last!) // pass a different screen

//: ### CGRect.init(size:) / CGRect.init(width:height:)
//: Creates a new CGRect object from origin zero with given size.

let someSize = CGSize(width: 100, height: 50)

let originZeroRect1 = CGRect(size: someSize)
let originZeroRect2 = CGRect(width: 100, height: 50)
