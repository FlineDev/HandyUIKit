//
//  Created by Murat Yilmaz on 25.10.18.
//  Copyright © 2018 Flinesoft. All rights reserved.
//

import UIKit

extension UITableView {
    /// Returns a reusable table view cell of type `cellType` with the name of its type as reuse identifier and adds it to the table.
    public func dequeueCell<Cell: UITableViewCell>(ofType cellType: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! Cell
    }

    /// Returns a reusable header or footer view of type `viewType` with the name of its type as reuse identifier and adds it to the table.
    public func dequeueHeaderFooterView<View: UITableViewHeaderFooterView>(ofType viewType: View.Type) -> View? {
        return dequeueReusableHeaderFooterView(withIdentifier: String(describing: viewType)) as? View
    }

    /// Registers a nib with the name of `cellType` if it exists or registers the class of type `cellType` as reusable cell.
    public func registerCell<Cell: UITableViewCell>(ofType cellType: Cell.Type) {
        let cellTypeName = String(describing: cellType)

        if Bundle.main.path(forResource: cellTypeName, ofType: "nib") != nil {
            register(UINib(nibName: cellTypeName, bundle: .main), forCellReuseIdentifier: cellTypeName)
        } else {
            register(cellType, forCellReuseIdentifier: cellTypeName)
        }
    }

    /// Registers a nib with the name of `viewType` if it exists or registers the class of type `viewType` as reusable header footer view.
    public func registerHeaderFooterView<View: UITableViewHeaderFooterView>(ofType viewType: View.Type) {
        let viewTypeName = String(describing: viewType)

        if Bundle.main.path(forResource: viewTypeName, ofType: "nib") != nil {
            register(UINib(nibName: viewTypeName, bundle: .main), forHeaderFooterViewReuseIdentifier: viewTypeName)
        } else {
            register(viewType, forHeaderFooterViewReuseIdentifier: viewTypeName)
        }
    }
}
