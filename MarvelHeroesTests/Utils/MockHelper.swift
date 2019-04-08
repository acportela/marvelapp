//
//  MockHelper.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//
import Foundation
@testable import MarvelHeroes

class MockHelper {
    
    let jsonHelper = JsonHelper()
    
    func responseFor<T: Decodable>(decodableType: T.Type) -> T {
        
        switch decodableType {
            
        case is APIResponse<MarvelCharacter>.Type:
            
            let data = jsonHelper.dataFromFile("CharactersResponse",
                                               andContext: type(of: self))
            return jsonHelper.parse(dataType: decodableType,
                                    from: data)
            
        case is APIResponse<CharacterMaterial>.Type:
            
            let data = jsonHelper.dataFromFile("CharacterDetailsResponse",
                                               andContext: type(of: self))
            return jsonHelper.parse(dataType: decodableType,
                                    from: data)
            
        default:
            fatalError("Decodable not registered. Please add a json mock file")
            
        }
        
    }
    
}
