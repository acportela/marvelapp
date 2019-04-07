//
//  CharacterDetailsDatasource.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharacterDetailsDatasource: NSObject, TableViewDatasource {
    
    let titles = ["Comics", "Events", "Stories", "Series"]
    
    private var comics: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([0], with: .bottom)
        }
    }
    
    private var events: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([1], with: .bottom)
        }
    }

    private var stories: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([2], with: .bottom)
        }
    }
    
    private var series: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([3], with: .bottom)
        }
    }
    
    weak var tableView: UITableView?
    
    required init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.register(CharacterMaterialCell.self)
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.reloadData()
    }
    
}

extension CharacterDetailsDatasource {
    
    private func items(forSection section: Int) -> [CharacterMaterial] {
        switch section {
        case 0:
            return comics
        case 1:
            return events
        case 2:
            return stories
        case 3:
            return series
        default:
            return []
        }
    }
    
    func updateTable(with data: [CharacterMaterial], ofKind kind: MaterialKind) {
        switch kind {
        case .comics:
            comics = data
        case .events:
            events = data
        case .series:
            series = data
        case .stories:
            stories = data
        }
    }
}

extension CharacterDetailsDatasource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items(forSection: section).count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard items(forSection: section).count > 0 else {
            return nil
        }
        
        let config = CharacterMaterialHeaderView.Configuration(name: titles[section])
        
        let view = CharacterMaterialHeaderView()
        view.setup(with: config)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CharacterMaterialCell.self, indexPath: indexPath)
        
        let items = self.items(forSection: indexPath.section)
        let material = items[indexPath.row]
        let config = CharacterMaterialCell.Configuration(name: material.title,
                                                         description: material.description)
        
        cell.setup(with: config)
        return cell
    }
    
}

extension CharacterDetailsDatasource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard items(forSection: section).count > 0 else {
            return 0
        }
        return CharacterMaterialHeaderView.height()
    }
    
}
