//
//  UIScrollViewExtension.swift
//  Cruciverber
//
//  Created by Cihat Gündüz on 06.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

extension UIScrollView {
    /// Renders the current content of the scroll view using its contentSize to an image.
    ///
    /// - Parameters:
    ///   - scale: The multiplicator to determine the resulting pixels. Defaults to main screen scale.
    /// - Returns: The rendered image.
    public func contentToImage(scale: CGFloat = UIScreen.main.scale) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(contentSize, isOpaque, scale)
        defer { UIGraphicsEndImageContext() }
        
        let contentRect = CGRect(origin: contentOffset, size: contentSize)
        drawHierarchy(in: contentRect, afterScreenUpdates: true)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
