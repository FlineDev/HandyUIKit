// Created by Cihat Gündüz on 06.01.17.

import UIKit

extension UIView {
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

#if IOS

    /// Animates view changes alongside keyboard animation using the same duration and animation curve.
    ///
    /// - Parameters:
    ///   - notification: The `Notification` object received from the NotificationCenter alongside the `.keyboardWillShow` notification.
    ///   - animations: The changes to animate.
    ///   - completion: Any work to be done after animations has completed.
    static func animateAlongsideKeyboard(_ notification: Notification, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        guard
            let userInfo = notification.userInfo,
            let durationNumber = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
            let curveNumber = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber,
            let curve = UIView.AnimationCurve(rawValue: curveNumber.intValue)
        else {
            animations()
            return
        }

        UIView.animate(
            withDuration: durationNumber.doubleValue,
            delay: 0,
            options: curve.toOptions(),
            animations: animations,
            completion: completion
        )
    }

#endif

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
    ///
    /// - Parameters:
    ///   - edgeInsets: Insets from the edge. Defaults to 0 on all edges.
    public func bindEdgesToSuperview(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superview = superview else {
            preconditionFailure("`superview` was nil – call `addSubview(view: UIView)` before calling `bindEdgesToSuperview()` to fix this.")
        }

        translatesAutoresizingMaskIntoConstraints = false
        ["H:|-\(insets.left)-[subview]-\(insets.right)-|", "V:|-\(insets.top)-[subview]-\(insets.bottom)-|"].forEach { visualFormat in
            superview.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: visualFormat,
                    options: .directionLeadingToTrailing,
                    metrics: nil,
                    views: ["subview": self]
                )
            )
        }
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

    /// Finds the subview in the view hierarchy matching the given predicate.
    ///
    /// NOTE: Uses DFS (depth first search).
    ///
    /// - Returns: The first subview in the viewhierarchy matching the given predicate or `nil` if not found.
    public func firstSubviewInHierarchy(matching predicate: (UIView) -> Bool) -> UIView? {
        return subviews.first(where: predicate) ?? subviews.first { $0.firstSubviewInHierarchy(matching: predicate) != nil }
    }
}

extension UIView.AnimationCurve {
    fileprivate func toOptions() -> UIView.AnimationOptions {
        return UIView.AnimationOptions(rawValue: UInt(rawValue << 16))
    }
}
