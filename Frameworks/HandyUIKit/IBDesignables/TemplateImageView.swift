// Created by Cihat Gündüz on 11.02.19.

import UIKit

@IBDesignable
public class TemplateImageView: UIImageView {
    override public var image: UIImage? {
        get {
            return super.image
        }

        set {
            super.image = newValue?.withRenderingMode(.alwaysTemplate)
        }
    }
}
