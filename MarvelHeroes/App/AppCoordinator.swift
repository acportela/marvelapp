//
//  AppCoordinator.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: class {
    func start()
}

class AppCoordinator: Coordinator {
    
    let service = MarvelService()
    private var navigation: UINavigationController
    
    init(rootViewController: UINavigationController) {
        navigation = rootViewController
    }
    
    func start() {
        configureNavigationBar()
        startCharacters()
    }
    
    func configureNavigationBar() {
        navigation.navigationBar.barTintColor = Resources.Colors.red
        navigation.navigationBar.tintColor = Resources.Colors.white
        navigation.navigationBar.barStyle = .black
        navigation.navigationBar.isTranslucent = false
    }
    
    private func startCharacters() {
        let characters = CharactersViewController()
        characters.delegate = self
        navigation.pushViewController(characters, animated: false)
    }
    
    private func startDetails(ofCharacter character: MarvelCharacter) {
        let details = CharacterDetailsViewController(character: character)
        navigation.pushViewController(details, animated: true)
    }
    
}

extension AppCoordinator: CharactersViewControllerDelegate {
    
    func charactersViewController(_ viewController: UIViewController,
                                  didTapDetailsOfCharacter character: MarvelCharacter) {
        startDetails(ofCharacter: character)
    }
    
}
