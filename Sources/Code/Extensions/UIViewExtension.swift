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
}
