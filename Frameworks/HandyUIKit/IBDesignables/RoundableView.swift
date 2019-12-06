// Created by Cihat Gündüz on 11.02.19.

import UIKit

@IBDesignable
open class RoundableView: UIView {
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        update()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        update()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        update()
    }

    private func setup() {
        clipsToBounds = true
    }

    private func update() {
        layer.cornerRadius = cornerRadius
    }
}
