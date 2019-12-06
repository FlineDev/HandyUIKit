// Created by Cihat Gündüz on 11.02.19.

import UIKit

@IBDesignable
open class TemplateButton: UIButton {
    override public func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image?.withRenderingMode(.alwaysTemplate), for: state)
    }
}
