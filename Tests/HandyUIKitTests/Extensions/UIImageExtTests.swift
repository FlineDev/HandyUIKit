// Copyright © 2018 Flinesoft. All rights reserved.

@testable import HandyUIKit
import XCTest

class UIImageExtTests: XCTestCase {
    func testToGrayscale() {
        let image = UIImage(named: "matt-lamers-261639-unsplash", in: Bundle(for: UIImageExtTests.self), compatibleWith: nil)!
        let grayscaleImage = image.toGrayscale()

        XCTAssert(grayscaleImage != nil)
    }

    func testPerformanceToGrayscale() {
        let image = UIImage(named: "matt-lamers-261639-unsplash", in: Bundle(for: UIImageExtTests.self), compatibleWith: nil)!

        measure {
            (0 ..< 5).forEach { _ in
                _ = image.toGrayscale()
            }
        }
    }
}
