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
        
        startCharacters()
    }
    
    private func startCharacters() {
        
        let controller = CharactersViewController()
        controller.delegate = self
        navigation.viewControllers = [controller]
        
        service.fetchCharacters { result in
            switch result {
            case .success:
                break
            case .error:
                break
            }
        }
        
    }
    
}

extension AppCoordinator: CharactersViewControllerDelegate {
    
    func charactersViewController(_ viewController: UIViewController,
                                  didTapDetailsOfCharacter character: Character) {
        
    }
    
}
