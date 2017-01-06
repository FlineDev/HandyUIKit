//
//  UIViewExtension.swift
//  Cruciverber
//
//  Created by Cihat Gündüz on 06.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

extension UIView {
    /// Renders the current content of the view using its bounds to an image.
    /// 
    /// - Parameters:
    ///   - scale: The multiplicator to determine the resulting pixels. Defaults to main screen scale.
    /// - Returns: The rendered image.
    public func toImage(scale: CGFloat = UIScreen.main.scale) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, scale)
        defer { UIGraphicsEndImageContext() }

        drawHierarchy(in: bounds, afterScreenUpdates: true)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
