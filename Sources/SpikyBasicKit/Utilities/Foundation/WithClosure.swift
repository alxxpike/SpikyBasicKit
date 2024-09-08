//
//  WithClosureUtility.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

public extension NSObjectProtocol {
    func with(_ configurator: (Self) -> Void) -> Self {
        (self as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        configurator(self)
        return self
    }
}
