//
//  FavoriteDelegateProtocol.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

protocol FavoriteDelegateProtocol: class {
    func didFavoriteCharacter(_ character: MarvelCharacter)
    func didUnfavoriteCharacter(_ character: MarvelCharacter)
}
