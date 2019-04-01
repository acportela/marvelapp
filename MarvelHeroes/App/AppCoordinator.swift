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
        let controller = CharactersViewController()
        controller.delegate = self
        navigation.pushViewController(controller, animated: false)
    }
    
    private func startDetails(ofCharacter character: Character,
                              withFavoriteState favorite: Bool) {
        
    }
    
}

extension AppCoordinator: CharactersViewControllerDelegate {
    
    func charactersViewController(_ viewController: UIViewController,
                                  didTapDetailsOfCharacter character: Character) {
        
    }
    
}
