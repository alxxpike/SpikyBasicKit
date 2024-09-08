//
//  TemplateView.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

/// Common parent UIView class
public class TemplateView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Virtual method to override. Is called during initialization.
    func prepare() {}
}

/// Common parent UIView class
public class TemplateButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Virtual method to override. Is called during initialization.
    func prepare() {}
}
