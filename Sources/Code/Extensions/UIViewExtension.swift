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
    ///   - scale: The multiplicator to determine the resulting pixels. Defaults to main screen scale.
    ///   - rect: The rect to draw into the image or `nil` to use views bounds. Defaults to `nil`.
    /// - Returns: The rendered image.
    public func toImage(scale: CGFloat = UIScreen.main.scale, rect: CGRect? = nil) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, scale)
        defer { UIGraphicsEndImageContext() }

        let rect = rect ?? bounds
        drawHierarchy(in: rect, afterScreenUpdates: true)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
