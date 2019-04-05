//
//  CharacterDetailsDatasource.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharacterDetailsDatasource: NSObject, TableViewDatasource {
    
    let titles = ["Comics", "Stories", "Events", "Series"]
    
    var comics: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([0], with: .bottom)
        }
    }
    
    var stories: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([1], with: .bottom)
        }
    }
    
    var events: [CharacterMaterial] = [] {
        didSet {
            tableView?.reloadSections([2], with: .bottom)
        }
    }
    
    var series: [CharacterMaterial] = [] {
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
    
    func items(forSection section: Int) -> [CharacterMaterial] {
        switch section {
        case 0:
            return comics
        case 1:
            return stories
        case 2:
            return events
        case 3:
            return series
        default:
            return []
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
        let name = titles[section]
        let config = CharacterMaterialHeaderView.Configuration(name: name)
        let view = CharacterMaterialHeaderView()
        view.setup(with: config)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(CharacterMaterialCell.self, indexPath: indexPath)
        
        let items = self.items(forSection: indexPath.section)
        let material = items[indexPath.row]
        //TODO Finish
        return cell
    }
    
}

extension CharacterDetailsDatasource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterMaterialCell.height()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CharacterMaterialHeaderView.height()
    }
    
}
