//
//  CollectionViewHandler.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

open class CollectionViewHandler<Model: CellModel>: TemplateView, UICollectionViewDelegate, UICollectionViewDataSource, Configurable {
    public var model = Model()
    
    public lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    ).with {
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.bounces = true
        ($0.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .vertical
    }
    
    public var layout: UICollectionViewLayout {
        get { collectionView.collectionViewLayout }
        set { collectionView.collectionViewLayout = newValue }
    }
    
    public var flowLayout: UICollectionViewFlowLayout? {
        get { collectionView.collectionViewLayout as? UICollectionViewFlowLayout }
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.cells.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = model.cells[safe: indexPath.row] else {
            return .empty()
        }
        return cell(model, collectionView: collectionView, indexPath: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
    
    /// Abstract method. Must me overriden!
    open func cell(_ model: Model.Cell, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return .empty()
    }
    
    ///  Always call super.configure
    open func configure(_ model: Model) {
        self.model = model
        collectionView.reloadData()
    }
}

public extension UICollectionViewCell {
    static func empty() -> UICollectionViewCell {
        return GenericCollectionCell<UIView>()
    }
}

