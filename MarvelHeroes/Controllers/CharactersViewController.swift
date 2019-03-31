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
    weak var delegate: CharactersViewControllerDelegate?
}
