//
//  GenericTableCell.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

final public class GenericTableCell<View>: UITableViewCell where View: UIView {

    public var wrappedView: View?
    public var insets: UIEdgeInsets = .zero {
        didSet {
            edges?.setInsets(insets)
        }
    }
    private var edges: EdgeConstraints?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepare()
    }
    
    @discardableResult
    public override func becomeFirstResponder() -> Bool {
        return wrappedView?.becomeFirstResponder() ?? false
    }
    
    @discardableResult
    public override func resignFirstResponder() -> Bool {
        return wrappedView?.resignFirstResponder() ?? false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepare() {
        let view = View()
        backgroundColor = .clear
        contentView.addSubview(view)
        edges = view.pinToSuperview()
        wrappedView = view
        selectionStyle = .none
    }
}

