//
//  UIImageExtension.swift
//  HandyUIKit
//
//  Created by Cihat Gündüz on 07.04.18.
//  Copyright © 2018 Flinesoft. All rights reserved.
//

import UIKit

extension UIImage {
    /// Creates a grayscale version of the image.
    ///
    /// - Returns: The grayscale image.
    public func toGrayscale() -> UIImage? {
        let imageRect = CGRect(size: size)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let contextOptional = CGContext(
            data: nil,
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: colorSpace,
            bitmapInfo: bitmapInfo.rawValue
        )

        guard let context = contextOptional else { return nil }
        context.draw(cgImage!, in: imageRect)

        guard let grayscaleCgImage = context.makeImage() else { return nil }
        return UIImage(cgImage: grayscaleCgImage)
    }
}
