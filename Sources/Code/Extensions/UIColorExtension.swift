//
//  UIColorExtension.swift
//  HandyUIKit
//
//  Created by Cihat Gündüz on 29.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

extension UIColor {
    /// A list of changeable attributes of the UIColor.
    ///
    /// - Red:          The red color part of RGB.
    /// - Green:        The green color part of RGB.
    /// - Blue:         The blue color part of RGB.
    /// - Alpha:        The alpha color part of RGB / HSB / HLC.
    /// - Hue:          The hue color part of HSB / HLC.
    /// - Saturation:   The saturation color part of HSB.
    /// - Brightness:   The brightness color part of HSB.
    ///
    public enum ChangeableAttribute {
        case red, green, blue, hueHSB, saturation, brightness, hueHLC, luminance, chroma, alpha
    }

    public convenience init(hue: CGFloat, luminance: CGFloat, chroma: CGFloat, alpha: CGFloat) {
        let rgb = LCHColor(l: luminance * 100, c: chroma * 128, h: hue * 360, alpha: alpha).toRGB()
        self.init(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: rgb.alpha)
    }

    // MARK: - Computed Properties

    /// The HLC & alpha attributes of the `UIColor` instance.
    public var hlca: (hue: CGFloat, luminance: CGFloat, chroma: CGFloat, alpha: CGFloat) {
        let lch = rgbColor().toLCH()
        return (hue: lch.h / 360, luminance: lch.l / 100, chroma: lch.c / 128, alpha: lch.alpha)
    }

    /// The HSB & alpha attributes of the `UIColor` instance.
    public var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) = (0, 0, 0, 0)
        getHue(&(hsba.hue), saturation: &(hsba.saturation), brightness: &(hsba.brightness), alpha: &(hsba.alpha))
        return hsba
    }

    /// The RGB & alpha attributes of the `UIColor` instance.
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) = (0, 0, 0, 0)
        getRed(&rgba.red, green: &rgba.green, blue: &rgba.blue, alpha: &rgba.alpha)
        return rgba
    }


    // MARK: - Methods

    /// Creates a new `UIColor` object with a single attribute changed by a given difference using addition.
    ///
    /// - Parameters:
    ///   - attribute: The attribute to change.
    ///   - by: The addition to be added to the current value of the attribute.
    /// - Returns: The resulting new `UIColor` with the specified change applied.
    public func change(_ attribute: ChangeableAttribute, by addition: CGFloat) -> UIColor {
        switch attribute {
        case .red:          return change(attribute, to: rgba.red + addition)
        case .green:        return change(attribute, to: rgba.green + addition)
        case .blue:         return change(attribute, to: rgba.blue + addition)
        case .hueHSB:       return change(attribute, to: hsba.hue + addition)
        case .saturation:   return change(attribute, to: hsba.saturation + addition)
        case .brightness:   return change(attribute, to: hsba.brightness + addition)
        case .hueHLC:       return change(attribute, to: hlca.hue + addition)
        case .luminance:    return change(attribute, to: hlca.luminance + addition)
        case .chroma:       return change(attribute, to: hlca.chroma + addition)
        case .alpha:        return change(attribute, to: hlca.alpha + addition)
        }
    }

    /// Creates a new `UIColor` object with the value of a single attribute set to a given value.
    ///
    /// - Parameters:
    ///   - attribute: The attribute to change.
    ///   - to: The new value to be set for the attribute.
    /// - Returns: The resulting new `UIColor` with the specified change applied.
    public func change(_ attribute: ChangeableAttribute, to newValue: CGFloat) -> UIColor {
        switch attribute {
        case .red, .green, .blue:
            var newRgba = rgba

            switch attribute {
            case .red:          newRgba.red = newValue
            case .green:        newRgba.green = newValue
            case .blue:         newRgba.blue = newValue
            default: break
            }
            return UIColor(red: newRgba.red, green: newRgba.green, blue: newRgba.blue, alpha: newRgba.alpha)

        case .hueHSB, .saturation, .brightness:
            var newHsba = hsba

            switch attribute {
            case .hueHSB:       newHsba.hue = newValue
            case .saturation:   newHsba.saturation = newValue
            case .brightness:   newHsba.brightness = newValue
            default: break
            }
            return UIColor(hue: newHsba.hue, saturation: newHsba.saturation, brightness: newHsba.brightness, alpha: newHsba.alpha)

        case .hueHLC, .luminance, .chroma, .alpha:
            var newHlca = hlca

            switch attribute {
            case .hueHLC:       newHlca.hue = newValue
            case .luminance:    newHlca.luminance = newValue
            case .chroma:       newHlca.chroma = newValue
            case .alpha:        newHlca.alpha = newValue
            default: break
            }
            return UIColor(hue: newHlca.hue, luminance: newHlca.luminance, chroma: newHlca.chroma, alpha: newHlca.alpha)
        }
    }
}
