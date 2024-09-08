//
//  Collections.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import Foundation

public extension Collection {
    @inlinable subscript(safe index: Index) -> Element? {
        startIndex..<endIndex ~= index ? self[index] : nil
    }
    
    @inlinable var notEmpty: Bool {
        isEmpty == false
    }
}

public extension MutableCollection {
    @inlinable subscript(safe index: Index) -> Element? {
        get {
            startIndex..<endIndex ~= index ? self[index] : nil
        }
        set {
            if startIndex..<endIndex ~= index, let newValue = newValue {
                self[index] = newValue
            }
        }
    }
}
