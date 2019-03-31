//
//  MarvelService.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

typealias CharactersResultType = Result<APIResponse<Character>>
typealias MaterialsResultType = Result<APIResponse<CharacterMaterial>>

protocol MarvelServiceProtocol: class {
    
    func fetchCharacters(name: String?, callback: @escaping (CharactersResultType) -> Void )
    func fetchComics(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    func fetchStories(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    func fetchEvents(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    func fetchSeries(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    
}

final class MarvelService: MarvelServiceProtocol {
    

    func fetchCharacters(name: String? = nil, callback: @escaping (CharactersResultType) -> Void) {
        
    }
    
    func fetchComics(characterID: Int, callback: @escaping (MaterialsResultType) -> Void) {
        
    }
    
    func fetchStories(characterID: Int, callback: @escaping (MaterialsResultType) -> Void) {
        
    }
    
    func fetchEvents(characterID: Int, callback: @escaping (MaterialsResultType) -> Void) {
        
    }
    
    func fetchSeries(characterID: Int, callback: @escaping (MaterialsResultType) -> Void) {
        
    }
    
}
