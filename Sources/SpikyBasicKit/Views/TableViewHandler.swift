//
//  TableViewHandler.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

public class TableViewHandler<Model: CellModel>: TemplateView, UITableViewDelegate, UITableViewDataSource, Configurable {
    var model = Model()
    lazy var tableView: UITableView = UITableView().with {
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.cells.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = model.cells[safe: indexPath.row] else {
            return .empty()
        }
        return cell(model, tableView: tableView, indexPath: indexPath)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let model = model.cells[safe: indexPath.row] else {
            return .zero
        }
        return height(model)
    }
    
    /// Abstract method. Must me overriden!
    func cell(_ model: Model.Cell, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return .empty()
    }

    /// Abstract method.
    func height(_ model: Model.Cell) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    ///  Always add super.configure
    public func configure(_ model: Model) {
        self.model = model
        tableView.reloadData()
    }
}


