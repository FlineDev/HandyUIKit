// Created by Cihat Gündüz on 07.04.18.

@testable import HandyUIKit
import XCTest

class UIImageExtensionTests: XCTestCase {
    func testToGrayscale() {
        let image = UIImage(named: "matt-lamers-261639-unsplash", in: Bundle(for: UIImageExtensionTests.self), compatibleWith: nil)!
        let grayscaleImage = image.toGrayscale()

        XCTAssert(grayscaleImage != nil)
    }

    func testPerformanceToGrayscale() {
        let image = UIImage(named: "matt-lamers-261639-unsplash", in: Bundle(for: UIImageExtensionTests.self), compatibleWith: nil)!

        measure {
            (0 ..< 5).forEach { _ in
                _ = image.toGrayscale()
            }
        }
    }
}
