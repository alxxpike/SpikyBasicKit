//
//  File.swift
//  
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import Foundation

public protocol CellModelConfigurable: Configurable where Model: CellModel {
    var model: Model { get }
}

public protocol CellModel {
    associatedtype Cell
    var cells: [Cell] { get }
    init()
}
