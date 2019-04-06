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
    func fetchCharacters(name: String?, offset: Int, callback: @escaping (CharactersResultType) -> Void )
    func fetchComics(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    func fetchStories(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    func fetchEvents(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
    func fetchSeries(characterID: Int, callback: @escaping (MaterialsResultType) -> Void )
}

final class MarvelService: MarvelServiceProtocol {
    
    func fetchCharacters(name: String? = nil, offset: Int, callback: @escaping (CharactersResultType) -> Void) {
        
        var queries = MarvelClient.Configuration.defaultQueries
        queries["offset"] = offset.description
        queries["limit"] = "20"

        if let someName = name, !someName.isEmpty {
            queries["nameStartsWith"] = someName
        }
        
        let url = buildURL(withQueries: queries)
        MarvelClient.sharedClient.requestDecodadle(url: url, callback: callback)
        
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

extension MarvelService {
    
    func flattened(queries: [String: String]) -> String {
        var flattened = "?"
        queries.forEach {
            let field = "\($0.key)=\($0.value)&"
            flattened += field
        }
        flattened.removeLast()
        return flattened
    }
    
    func buildURL(withQueries queries: [String: String] = MarvelClient.Configuration.defaultQueries) -> URL {
        let baseAndPath = MarvelClient.Configuration.baseURL + MarvelEndpoints.characters.path
        let urlString = baseAndPath + flattened(queries: queries)
        return URL(string: urlString)!
    }
    
}
