// Created by Cihat Gündüz on 29.01.17.

@testable import HandyUIKit
import XCTest

// Note: The tests in here work best if run on a Retina device (e.g. iPhone 6s Plus Simulator).
class CoreGraphicsExtensionsTests: XCTestCase {
    let size: CGFloat = 22

    func testCGSizeInPixels() {
        let testSize = CGSize(width: size, height: size)

        let expectedPixelSize = size * UIScreen.main.scale
        let testSizeInPixels = testSize.inPixels

        XCTAssertEqual(testSizeInPixels.width, expectedPixelSize, accuracy: 0.001)
        XCTAssertEqual(testSizeInPixels.height, expectedPixelSize, accuracy: 0.001)
    }

    func testCGSizeInPixelsScreen() {
        let testSize = CGSize(width: size, height: size)

        let testScreen = UIScreen()
        let expectedPixelSize = size * testScreen.scale

        let testSizeInPixels = testSize.inPixels(testScreen)

        XCTAssertEqual(testSizeInPixels.width, expectedPixelSize, accuracy: 0.001)
        XCTAssertEqual(testSizeInPixels.height, expectedPixelSize, accuracy: 0.001)
    }

    func testCGPointInPixels() {
        let testPoint = CGPoint(x: size, y: size)

        let expectedPixelPointSizes = size * UIScreen.main.scale
        let testPointInPixels = testPoint.inPixels

        XCTAssertEqual(testPointInPixels.x, expectedPixelPointSizes, accuracy: 0.001)
        XCTAssertEqual(testPointInPixels.y, expectedPixelPointSizes, accuracy: 0.001)
    }

    func testCGPointInPixelsScreen() {
        let testPoint = CGPoint(x: size, y: size)

        let testScreen = UIScreen()
        let expectedPixelPointSizes = size * testScreen.scale

        let testPointInPixels = testPoint.inPixels(testScreen)

        XCTAssertEqual(testPointInPixels.x, expectedPixelPointSizes, accuracy: 0.001)
        XCTAssertEqual(testPointInPixels.y, expectedPixelPointSizes, accuracy: 0.001)
    }

    func testCGRectInPixels() {
        let testRect = CGRect(x: size, y: size, width: size, height: size)

        let expectedPixelRectSizes = size * UIScreen.main.scale
        let testRectInPixels = testRect.inPixels

        XCTAssertEqual(testRectInPixels.origin.x, expectedPixelRectSizes, accuracy: 0.001)
        XCTAssertEqual(testRectInPixels.origin.y, expectedPixelRectSizes, accuracy: 0.001)
        XCTAssertEqual(testRectInPixels.size.width, expectedPixelRectSizes, accuracy: 0.001)
        XCTAssertEqual(testRectInPixels.size.height, expectedPixelRectSizes, accuracy: 0.001)
    }

    func testCGRectInPixelsScreen() {
        let testRect = CGRect(x: size, y: size, width: size, height: size)

        let testScreen = UIScreen()
        let expectedPixelRectSizes = size * testScreen.scale

        let testRectInPixels = testRect.inPixels(testScreen)

        XCTAssertEqual(testRectInPixels.origin.x, expectedPixelRectSizes, accuracy: 0.001)
        XCTAssertEqual(testRectInPixels.origin.y, expectedPixelRectSizes, accuracy: 0.001)
        XCTAssertEqual(testRectInPixels.size.width, expectedPixelRectSizes, accuracy: 0.001)
        XCTAssertEqual(testRectInPixels.size.height, expectedPixelRectSizes, accuracy: 0.001)
    }

    func testCGRectInitSize() {
        let testSize = CGSize(width: size, height: size)
        let testRect = CGRect(size: testSize)

        XCTAssertEqual(testRect.origin.x, 0.0, accuracy: 0.001)
        XCTAssertEqual(testRect.origin.y, 0.0, accuracy: 0.001)
        XCTAssertEqual(testRect.size.width, testSize.width, accuracy: 0.001)
        XCTAssertEqual(testRect.size.height, testSize.height, accuracy: 0.001)
    }

    func testCGRectInitWidthHeight() {
        let testRect = CGRect(width: size, height: size)

        XCTAssertEqual(testRect.origin.x, 0.0, accuracy: 0.001)
        XCTAssertEqual(testRect.origin.y, 0.0, accuracy: 0.001)
        XCTAssertEqual(testRect.size.width, size, accuracy: 0.001)
        XCTAssertEqual(testRect.size.height, size, accuracy: 0.001)
    }
}
