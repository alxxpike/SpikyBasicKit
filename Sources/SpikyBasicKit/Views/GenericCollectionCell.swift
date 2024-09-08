//
//  GenericCollectionCell.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

public final class GenericCollectionCell<View>: UICollectionViewCell where View: UIView {
    
    weak var wrappedView: View?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepare() {
        let view = View()
        contentView.addSubview(view)
        view.pinToSuperview()
        wrappedView = view
    }
}
