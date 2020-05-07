// Copyright © 2017 Flinesoft. All rights reserved.

// swiftlint:disable object_literal

@testable import HandyUIKit
import XCTest

class ColorExtTests: XCTestCase {
    func testHlca() {
        let color = UIColor(hue: 0.1, luminance: 0.2, chroma: 0.3, alpha: 0.4)

        XCTAssertEqual(color.hlca.hue, 0.1, accuracy: 0.001)
        XCTAssertEqual(color.hlca.luminance, 0.2, accuracy: 0.001)
        XCTAssertEqual(color.hlca.chroma, 0.3, accuracy: 0.001)
        XCTAssertEqual(color.hlca.alpha, 0.4, accuracy: 0.001)
    }

    func testRgba() {
        let color = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)

        XCTAssertEqual(color.rgba.red, 0.1, accuracy: 0.001)
        XCTAssertEqual(color.rgba.green, 0.2, accuracy: 0.001)
        XCTAssertEqual(color.rgba.blue, 0.3, accuracy: 0.001)
        XCTAssertEqual(color.rgba.alpha, 0.4, accuracy: 0.001)
    }

    func testHsba() {
        let color = UIColor(hue: 0.1, saturation: 0.2, brightness: 0.3, alpha: 0.4)

        XCTAssertEqual(color.hsba.hue, 0.1, accuracy: 0.001)
        XCTAssertEqual(color.hsba.saturation, 0.2, accuracy: 0.001)
        XCTAssertEqual(color.hsba.brightness, 0.3, accuracy: 0.001)
        XCTAssertEqual(color.hsba.alpha, 0.4, accuracy: 0.001)
    }

    func testChangeAttributeBy() {
        let rgbaColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)
        let changedRgbaColor = rgbaColor.change(.red, by: 0.1).change(.green, by: 0.1).change(.blue, by: 0.1).change(.alpha, by: 0.1)

        XCTAssertEqual(changedRgbaColor.rgba.red, 0.2, accuracy: 0.001)
        XCTAssertEqual(changedRgbaColor.rgba.green, 0.3, accuracy: 0.001)
        XCTAssertEqual(changedRgbaColor.rgba.blue, 0.4, accuracy: 0.001)
        XCTAssertEqual(changedRgbaColor.rgba.alpha, 0.5, accuracy: 0.001)

        let hsbaColor = UIColor(hue: 0.1, saturation: 0.2, brightness: 0.3, alpha: 0.4)
        let changedHsbaColor = hsbaColor.change(.hueHSB, by: 0.1).change(.saturation, by: 0.1).change(.brightness, by: 0.1).change(.alpha, by: 0.1)

        XCTAssertEqual(changedHsbaColor.hsba.hue, 0.2, accuracy: 0.001)
        XCTAssertEqual(changedHsbaColor.hsba.saturation, 0.3, accuracy: 0.001)
        XCTAssertEqual(changedHsbaColor.hsba.brightness, 0.4, accuracy: 0.001)
        XCTAssertEqual(changedHsbaColor.hsba.alpha, 0.5, accuracy: 0.001)
    }

    func testChangeAttributeTo() {
        let rgbaColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)
        let changedRgbaColor = rgbaColor.change(.red, to: 1.0).change(.green, to: 0.9).change(.blue, to: 0.8).change(.alpha, to: 0.7)

        XCTAssertEqual(changedRgbaColor.rgba.red, 1.0, accuracy: 0.001)
        XCTAssertEqual(changedRgbaColor.rgba.green, 0.9, accuracy: 0.001)
        XCTAssertEqual(changedRgbaColor.rgba.blue, 0.8, accuracy: 0.001)
        XCTAssertEqual(changedRgbaColor.rgba.alpha, 0.7, accuracy: 0.001)

        let hsbaColor = UIColor(hue: 0.1, saturation: 0.2, brightness: 0.3, alpha: 0.4)
        let changedHsbaColor = hsbaColor.change(.hueHSB, to: 1.0).change(.saturation, to: 0.9).change(.brightness, to: 0.8).change(.alpha, to: 0.7)

        XCTAssertEqual(changedHsbaColor.hsba.hue, 0.0, accuracy: 0.001)
        XCTAssertEqual(changedHsbaColor.hsba.saturation, 0.9, accuracy: 0.001)
        XCTAssertEqual(changedHsbaColor.hsba.brightness, 0.8, accuracy: 0.001)
        XCTAssertEqual(changedHsbaColor.hsba.alpha, 0.7, accuracy: 0.001)
    }
}
