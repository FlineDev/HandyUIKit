// Copyright © 2019 Flinesoft. All rights reserved.

import UIKit

@IBDesignable
open class TemplateButton: UIButton {
    override public func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image?.withRenderingMode(.alwaysTemplate), for: state)
    }
}
