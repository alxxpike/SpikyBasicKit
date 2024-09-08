//
//  Configurable.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import Foundation

public protocol EquallyConfigurable: Configurable where Model: Equatable {}

public protocol Configurable {
    associatedtype Model
    func configure(_ model: Model)
}
