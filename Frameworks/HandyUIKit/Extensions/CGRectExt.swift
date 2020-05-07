// Copyright © 2018 Flinesoft. All rights reserved.

import UIKit

extension CGRect {
    /// Returns a new CGRect object with the origin and size converted to true pixels on the main screen.
    public var inPixels: CGRect { inPixels(.main) }

    /// Creates a new CGRect object from origin zero with given size.
    ///
    /// - Parameters:
    ///   - size: The size of the new rect.
    public init(size: CGSize) { self.init(origin: .zero, size: size) }

    /// Creates a new CGRect object from origin zero with given size.
    ///
    /// - Parameters:
    ///   - width: The width of the new rect.
    ///   - height: The height of the new rect.
    public init(width: CGFloat, height: CGFloat) {
        self.init(origin: .zero, size: CGSize(width: width, height: height))
    }

    /// Returns a new CGRect object with the origin and size converted to true pixels on the given screen.
    ///
    /// - Parameters:
    ///   - screen: The target screen to convert to pixels for.
    public func inPixels(_ screen: UIScreen) -> CGRect {
        CGRect(origin: origin.inPixels(screen), size: size.inPixels(screen))
    }
}
