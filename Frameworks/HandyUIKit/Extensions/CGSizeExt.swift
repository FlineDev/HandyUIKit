// Copyright © 2018 Flinesoft. All rights reserved.

import UIKit

extension CGSize {
    /// Returns a new CGSize object with the width and height converted to true pixels on the main screen.
    public var inPixels: CGSize { inPixels(.main) }

    /// Returns a new CGSize object with the width and height converted to true pixels on the given screen.
    ///
    /// - Parameters:
    ///   - screen: The target screen to convert to pixels for.
    public func inPixels(_ screen: UIScreen) -> CGSize {
        CGSize(width: width * screen.scale, height: height * screen.scale)
    }
}
