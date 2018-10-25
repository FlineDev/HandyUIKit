//
//  UITableViewExtension.swift
//  HandyUIKit
//
//  Created by Murat Yilmaz on 25.10.18.
//  Copyright © 2018 Flinesoft. All rights reserved.
//

import UIKit

extension UITableView {
    public func dequeueCell<Cell: UITableViewCell>(ofType cellType: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! Cell
    }

    public func dequeueHeaderFooterView<View: UITableViewHeaderFooterView>(ofType viewType: View.Type) -> View? {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: viewType)) as? View
    }

    public func registerCell<Cell: UITableViewCell>(ofType cellClass: Cell.Type) {
        let cellClassName = String(describing: cellClass)

        if Bundle.main.path(forResource: cellClassName, ofType: "nib") != nil {
            register(UINib(nibName: cellClassName, bundle: .main), forCellReuseIdentifier: cellClassName)
        } else {
            register(cellClass, forCellReuseIdentifier: cellClassName)
        }
    }

    public func registerHeaderFooterView<View: UITableViewHeaderFooterView>(ofType viewClass: View.Type) {
        let viewClassName = String(describing: viewClass)

        if Bundle.main.path(forResource: viewClassName, ofType: "nib") != nil {
            register(UINib(nibName: viewClassName, bundle: .main), forHeaderFooterViewReuseIdentifier: viewClassName)
        } else {
            register(viewClass, forHeaderFooterViewReuseIdentifier: viewClassName)
        }
    }
}
