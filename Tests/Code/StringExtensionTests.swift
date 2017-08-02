//
//  StringExtensionTests.swift
//  HandyUIKit
//
//  Created by Cihat Gündüz on 19.02.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import XCTest

@testable import HandyUIKit

class StringExtensionTests: XCTestCase {
    let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." // swiftlint:disable:this line_length

    func testHeight() {
        let font = UIFont(name: "Helvetica Neue", size: 16)!
        let calculatedHeight = loremIpsum.height(forFixedWidth: 300, font: font)

        XCTAssertEqualWithAccuracy(calculatedHeight, 205.04, accuracy: 0.001)
    }

    func testWidth() {
        let font = UIFont(name: "Helvetica Neue", size: 16)!
        let calculatedHeight = loremIpsum.width(forFixedHeight: 21, font: font)

        XCTAssertEqualWithAccuracy(calculatedHeight, 3_014.592, accuracy: 0.001)
    }
}
