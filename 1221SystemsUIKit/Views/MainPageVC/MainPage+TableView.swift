//
//  MainPage+CollectionView.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//

import UIKit

extension MainPageViewController: UITableViewDelegate{
    
    internal func setupTable() {
        contentView.addSubview(table)
        registercells()
        setupTableConstraints()
        initialSnapshot()
    }
    
    internal func registercells() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    internal func setupTableConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: lblScroll.bottomAnchor, constant: 10),
            table.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            table.leadingAnchor.constraint(equalTo: separator.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: separator.trailingAnchor),
        ])
    }
    
    internal func initialSnapshot() {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.date])
        snapshot.appendItems([.init(name: "kek"),.init(name: "kek1"),.init(name: "kek2"), .init(name: "sss"), .init(name: "wwww"), .init(name: "wwww"), .init(name: "wwww")])
        dataSource.apply(snapshot)
    }
}




