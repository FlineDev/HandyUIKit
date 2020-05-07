// Copyright © 2019 Flinesoft. All rights reserved.

import UIKit

@IBDesignable
open class TemplateImageView: UIImageView {
    override public var image: UIImage? {
        get {
            super.image
        }

        set {
            super.image = newValue?.withRenderingMode(.alwaysTemplate)
        }
    }
}
