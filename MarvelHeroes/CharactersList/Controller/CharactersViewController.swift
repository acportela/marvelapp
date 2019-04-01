//
//  CharactersViewController.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

protocol CharactersViewControllerDelegate: class {
    func charactersViewController(_ viewController: UIViewController,
                                  didTapDetailsOfCharacter character: Character)
}

final class CharactersViewController: UIViewController {
    
    let charactersView = CharactersView()
    let service = MarvelService()
    lazy var dataSource = CharactersDatasource(tableView: charactersView.tableView)
    
    var resultSet = 0
    var nextPage: Int = 0
    var isLoadingData = false
    
    var currentSearch: String? {
        didSet {
            resetState()
            fetchCharacters()
        }
    }
    
    weak var delegate: CharactersViewControllerDelegate?
    
    override func loadView() {
        self.view = charactersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersView.searchBar.delegate = self
        dataSource.delegate = self
        
        title = "Marvel Characters"
        fetchCharacters()
    }
    
}

extension CharactersViewController {
    
    private func fetchCharacters() {
        
        if isLoadingData { return }
        if resultSet != 0, dataSource.items.count == resultSet { return }
        
        charactersView.activityIndicator.isHidden = false
        isLoadingData = true
        
        service.fetchCharacters(name: currentSearch, offset: nextPage*20) { [weak self] result in
            
            self?.charactersView.activityIndicator.isHidden = true
            self?.isLoadingData = false
            
            switch result {
            case .success(let response):
                //TODO refactor page update logic
                self?.nextPage += 1
                self?.resultSet = response.data.total
                self?.dataSource.items.append(contentsOf: response.data.results)
            case .error:
                break
            }
            
        }
        
    }
    
    func resetState() {
        nextPage = 0
        resultSet = 0
        dataSource.items = []
    }
    
}
extension CharactersViewController: CharactersDelegateProtocol {
    
    func didSelectCharacter(_ character: Character) {
        delegate?.charactersViewController(self, didTapDetailsOfCharacter: character)
    }
    
    func shouldFetchMoreContent() {
        fetchCharacters()
    }

    func didFavoriteCharacter(_ character: Character) {
        
    }
    
    func didUnfavoriteCharacter(_ character: Character) {
        
    }

}

extension CharactersViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        charactersView.searchBar.resignFirstResponder()
        charactersView.searchBar.showsCancelButton = false
        
        let typingQuery = charactersView.searchBar.text
        guard let valid = typingQuery, !valid.isEmpty else {
            return
        }
        
        currentSearch = charactersView.searchBar.text
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        currentSearch = nil
        charactersView.searchBar.text = ""
        charactersView.searchBar.showsCancelButton = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        charactersView.searchBar.showsCancelButton = true
    }
    
}
