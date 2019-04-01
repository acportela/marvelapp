//
//  CharactersDelegate.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

protocol CharactersDelegateProtocol: class {
    func didSelectCharacter(_ character: Character)
    func didFavoriteCharacter(_ character: Character)
    func didUnfavoriteCharacter(_ character: Character)
    func shouldFetchMoreContent()
}
