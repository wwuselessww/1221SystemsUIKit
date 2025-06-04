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
        table.delegate = self
        registercells()
        setupTableConstraints()
        
        table.isScrollEnabled = false

    }
    
    internal func registercells() {
        table.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.identifier)
    }
    
    internal func setupTableConstraints() {
        tableHeightConstraint = table.heightAnchor.constraint(equalToConstant: 1)
        tableHeightConstraint?.isActive = true
        table.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: lblScroll.bottomAnchor, constant: 10),
            table.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: separator.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: separator.trailingAnchor),
        ])
    }
    
    internal func initialSnapshot() {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.date])
        snapshot.appendItems(vm.forecastArray)
        dataSource.apply(snapshot)
    }
    
    func updateSnapshot() {
        print("updated")
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(self.vm.forecastArray)
        dataSource.apply(snapshot)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
