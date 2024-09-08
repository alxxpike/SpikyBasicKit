//
//  TypeDescription.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import Foundation

public extension NSObject {
    static var typeDescription: String {
        String(describing: self)
    }
    
    var typeDescription: String {
        type(of: self).typeDescription
    }
    
    
    static var className: String {
        String(describing: self)
    }
    
    var className: String {
        type(of: self).className
    }
}
