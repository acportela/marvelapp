//
//  CharactersTableViewDataSource.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

protocol TableViewDatasource {
    
    associatedtype ItemType
    
    var items: [ItemType] {get}
    var tableView: UITableView? {get}
    
    init(items: [ItemType], tableView: UITableView)
    
    func setupTableView()
    
}

final class CharactersDatasource: NSObject, TableViewDatasource {
    
    var items: [Character] {
        didSet {
            tableView?.reloadData()
        }
    }
    weak var tableView: UITableView?
    weak var delegate: CharactersDelegateProtocol?
    
    var lastOffset = CGPoint.zero
    
    required init(items: [Character] = [], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
        super.init()
        tableView.register(CharacterTableViewCell.self)
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.reloadData()
    }
    
}

extension CharactersDatasource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(CharacterTableViewCell.self, indexPath: indexPath)
        
        let character = self.items[indexPath.row]
        let config = CharacterTableViewCell.Configuration(name: character.name,
                                                          about: character.description,
                                                          isFavorite: false,
                                                          image: character.thumbnail)
        
        cell.characterWasFavorited = { [weak self] favorite in
            favorite ? self?.delegate?.didFavoriteCharacter(character)
            : self?.delegate?.didUnfavoriteCharacter(character)
        }
        cell.setup(with: config)
        
        if tableView.contentOffset.y > self.lastOffset.y, indexPath.row == items.count-5 {
            delegate?.shouldFetchMoreContent()
        }
        lastOffset = tableView.contentOffset
        
        return cell
    }
    
}

extension CharactersDatasource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterTableViewCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCharacter(items[indexPath.row])
    }
    
}