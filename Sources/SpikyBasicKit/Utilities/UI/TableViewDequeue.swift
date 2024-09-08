//
//  TableViewDequeue.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

public extension UITableView {
    /// Registers and dequeues generic cell with type-based reuse identifier.
    func cell<T>(with reuseIdentifier: String = T.typeDescription, for indexPath: IndexPath) -> T where T: UITableViewCell {
        register(T.self, forCellReuseIdentifier: reuseIdentifier)
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("UITableView failed to dequeue cell with identifier: \(reuseIdentifier)")
        }
        return cell
    }
    func register<T: UITableViewHeaderFooterView>(headerFooterWithClass type: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: type.className)
    }

    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(withClass type: T.Type) -> T {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T else {
            fatalError("Couldn't find UITableViewHeaderFooterView for \(type.className)")
        }
        return headerFooter
    }
}

public extension UITableViewCell {
    static func empty() -> UITableViewCell {
        UITableViewCell()
    }
}
