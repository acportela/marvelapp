//
//  MarvelService.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

typealias CharactersResultType = Result<APIResponse<MarvelCharacter>>
typealias MaterialsResultType = Result<APIResponse<CharacterMaterial>>

protocol MarvelServiceProtocol: class {
    func fetchCharacters(name: String?, offset: Int, callback: @escaping (CharactersResultType) -> Void )
    func fetchMaterial(ofKind kind: MaterialKind, callback: @escaping (MaterialsResultType) -> Void )
}

final class MarvelService: MarvelServiceProtocol {
    
    let client: APIClient
    
    init(client: APIClient = MarvelClient.sharedClient) {
        self.client = client
    }
    
    public func fetchMaterial(ofKind kind: MaterialKind, callback: @escaping (MaterialsResultType) -> Void) {
        var queries = MarvelClient.Configuration.defaultQueries
        queries["limit"] = "3"
        
        let url = buildURL(forPath: kind.endpoint.path,
                           andQueries: queries)
        
        client.requestDecodadle(url: url, callback: callback)
    }
    
    public func fetchCharacters(name: String? = nil,
                                offset: Int = 0,
                                callback: @escaping (CharactersResultType) -> Void) {
        
        var queries = MarvelClient.Configuration.defaultQueries
        queries["offset"] = offset.description
        queries["limit"] = "20"

        if let someName = name, !someName.isEmpty {
            queries["nameStartsWith"] = someName
        }
        
        let url = buildURL(forPath: MarvelEndpoints.characters.path, andQueries: queries)
        client.requestDecodadle(url: url, callback: callback)
        
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
    
    func buildURL(forPath path: String, andQueries queries: [String: String]) -> URL {
        let baseAndPath = MarvelClient.Configuration.baseURL + path
        let urlString = baseAndPath + flattened(queries: queries)
        return URL(string: urlString)!
    }
    
}
