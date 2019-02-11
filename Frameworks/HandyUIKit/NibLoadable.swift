// Created by Cihat Gündüz on 11.02.19.

import UIKit

public enum NibLoadableError: Error {
    case xibNotFound
    case xibHasNoViews
    case xibHasMultipleRootViews
}

public protocol NibLoadable: class {
    static var nibName: String { get }

    func nibDidLoad()
}

extension NibLoadable where Self: UIView {
    /// The name of the nib file. Defaults to the same name as the class.
    public static var nibName: String {
        return String(describing: self)
    }

    /// Loads the contents of this view from the corresponding Nib file.
    ///
    /// NOTE: This view must be the 'File's Owner', not the 'View' within the Nib file.
    public func loadFromNib() throws {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).nibName
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let views = nib.instantiate(withOwner: self, options: nil) as? [UIView] else {
            throw NibLoadableError.xibNotFound
        }

        guard !views.isEmpty else {
            throw NibLoadableError.xibHasNoViews
        }

        guard views.count <= 1 else {
            throw NibLoadableError.xibHasMultipleRootViews
        }

        let viewFromNib = views[0]
        addSubview(viewFromNib)
        viewFromNib.bindEdgesToSuperview()

        nibDidLoad()
    }

    /// An empty implementation of nibDidLoad so subclasses don't necessarily need to override it.
    public func nibDidLoad() { /* no-op */ }
}
