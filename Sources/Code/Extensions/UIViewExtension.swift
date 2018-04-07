//
//  UIViewExtension.swift
//  HandyUIKit
//
//  Created by Cihat Gündüz on 06.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

extension UIView {
    /// Renders the current content of the view using its bounds to an image.
    /// 
    /// - Parameters:
    ///   - rect: The rect to draw into the image or `nil` to use views bounds. Defaults to `nil`.
    /// - Returns: The rendered image.
    public func toImage(size: CGSize? = nil) -> UIImage {
        let rect = size != nil ? CGRect(size: size!) : bounds
        UIGraphicsBeginImageContextWithOptions(rect.size, isOpaque, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }

        drawHierarchy(in: rect, afterScreenUpdates: true)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }

    /// Adds constraints to the superview so that this view has same size and position.
    /// Note: This fails the build if the `superview` is `nil` – add it as a subview before calling this.
    public func bindEdgesToSuperview() {
        guard let superview = superview else {
            preconditionFailure("`superview` was nil – call `addSubview(view: UIView)` before calling `bindEdgesToSuperview()` to fix this.")
        }

        translatesAutoresizingMaskIntoConstraints = false
        ["H:|-0-[subview]-0-|", "V:|-0-[subview]-0-|"].forEach { visualFormat in
            superview.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: visualFormat, options: .directionLeadingToTrailing,
                metrics: nil, views: ["subview": self])
            )
        }
    }

    /// Finds all superviews in the view hierarchy.
    ///
    /// - Returns: A list of all superview starting with the superview of this view if any.
    public var superviews: [UIView] {
        guard let superview = superview else { return [] }

        var superviews: [UIView] = [superview]
        while let nextLevelSuperview = superviews.last!.superview {
            superviews.append(nextLevelSuperview)
        }

        return superviews
    }

    /// Finds the first superview of all superviews matching a predicate.
    ///
    /// - Parameters:
    ///   - predicate: The predicate to match superviews against.
    /// - Returns: The first matching superview or `nil`.
    public func firstSuperview(where predicate: (UIView) -> Bool) -> UIView? {
        var nextSuperview: UIView? = superview

        while nextSuperview != nil {
            guard !predicate(nextSuperview!) else { return nextSuperview }
            nextSuperview = nextSuperview?.superview
        }

        return nil
    }

    /// Finds the firstResponder in this view hierarchy by traversing its subviews recursively.
    ///
    /// NOTE: Uses DFS (depth first search).
    ///
    /// - Returns: The firstResponder view in the subview hierarchy.
    public var firstResponder: UIView? {
        guard !isFirstResponder else { return self }

        for subview in subviews {
            guard let firstResponder = subview.firstResponder else { continue }
            return firstResponder
        }

        return nil
    }
}
