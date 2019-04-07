//
//  CharactersTableViewDataSource.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

protocol TableViewDatasource {
    
    var tableView: UITableView? {get}
    
    init(tableView: UITableView)
    
    func setupTableView()
    
}

final class CharactersDatasource: NSObject, TableViewDatasource {
    
    var characters: [Character] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    weak var tableView: UITableView?
    weak var charactersDelegate: CharactersDelegateProtocol?
    weak var favoriteDelegate: FavoriteDelegateProtocol?
    let storage = FavoriteCharactersStorage()
    
    var lastOffset = CGPoint.zero
    
    init(tableView: UITableView) {
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
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(CharacterTableViewCell.self, indexPath: indexPath)
        
        let character = characters[indexPath.row]
        
        let isFavorite = storage.get()?.ids.contains(character.id) ?? false
        
        let config = CharacterTableViewCell.Configuration(name: character.name,
                                                          about: character.description,
                                                          isFavorite: isFavorite,
                                                          image: character.thumbnail)
        
        cell.characterWasFavorited = { [weak self] favorite in
            favorite ? self?.favoriteDelegate?.didFavoriteCharacter(character)
            : self?.favoriteDelegate?.didUnfavoriteCharacter(character)
        }
        cell.setup(with: config)
        
        if tableView.contentOffset.y > self.lastOffset.y, indexPath.row == characters.count-5 {
            charactersDelegate?.shouldFetchMoreContent()
        }
        lastOffset = tableView.contentOffset
        
        return cell
    }
    
}

extension CharactersDatasource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return characters[indexPath.row].description.isEmpty ? 96 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        charactersDelegate?.didSelectCharacter(characters[indexPath.row])
    }
    
}
