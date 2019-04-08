//
//  CharacterDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/6/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    
    let character: MarvelCharacter
    let detailsView = CharacterDetailsView()
    let storage = FavoriteCharactersStorage()
    let service: MarvelServiceProtocol
    var alertController: UIAlertController?
    lazy var dataSource = CharacterDetailsDatasource(tableView: detailsView.tableView)
    weak var favoriteDelegate: FavoriteDelegateProtocol?
    
    init(character: MarvelCharacter, service: MarvelServiceProtocol = MarvelService()) {
        self.character = character
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize this view controller with view code")
    }
    
    override func loadView() {
        self.view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        favoriteDelegate = self
        fetchDetails()
    }
    
    func setupView() {
        
        title = character.name
        
        var isFavorite = false
        if let favorites = storage.get(from: .favorites)?.ids, favorites.contains(character.id) {
            isFavorite = true
        }
        
        let config = CharacterDetailsView.Configuration.init(character: character,
                                                             isFavorite: isFavorite)
        detailsView.setup(with: config)
        
        detailsView.characterWasFavorited = { [weak self] wasFavorited in
            guard let sSelf = self else { return }
            wasFavorited ? sSelf.favoriteDelegate?.didFavoriteCharacter(sSelf.character)
            : sSelf.favoriteDelegate?.didUnfavoriteCharacter(sSelf.character)
        }
        
    }
    
}

extension CharacterDetailsViewController {
    
    func fetchDetails() {
        fetchMaterial(ofKind: .comics(character.id))
        fetchMaterial(ofKind: .events(character.id))
        fetchMaterial(ofKind: .stories(character.id))
        fetchMaterial(ofKind: .series(character.id))
    }
    
    func fetchMaterial(ofKind kind: MaterialKind) {
        
        detailsView.startActivityIndicator()
        
        service.fetchMaterial(ofKind: kind) { [weak self] result in
            
            self?.detailsView.stopActivityIndicator()
            
            switch result {
                
            case .success(let response):
                guard response.data.total > 0 else { return }
                let results = Array(response.data.results.prefix(3))
                self?.dataSource.updateTable(with: results, ofKind: kind)
                
            case .error(let error):
                self?.handleError(error: error)
            }
            
        }
    }
    
    func handleError(error: ResponseError) {
        let handler: ((UIAlertAction) -> Void) = { [weak self] _ in
            self?.alertController = nil
            self?.fetchDetails()
        }
        if self.alertController == nil {
            alertController = UIAlertController(title: error.title,
                                          message: error.message,
                                          positiveActionTitle: error.buttonTitle,
                                          handler: handler)
            if let alert = alertController {
                present(alert, animated: true)
            }
        }
    }
    
}

extension CharacterDetailsViewController: FavoriteDelegateProtocol {
    func didFavoriteCharacter(_ character: MarvelCharacter) {
        guard var favorites = storage.get() else {
            let ids: Set<Int> = [character.id]
            storage.set(FavoriteCharacters(ids: ids))
            return
        }
        favorites.ids.insert(character.id)
        storage.set(favorites)
    }
    
    func didUnfavoriteCharacter(_ character: MarvelCharacter) {
        guard var favorites = storage.get() else { return }
        favorites.ids.remove(character.id)
        storage.set(favorites)
    }
}
