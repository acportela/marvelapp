//
//  CharactersResponse.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    let code: Int
    let data: Content<T>
}

struct Content<T: Codable>: Codable {
    let total: Int
    let results: [T]
}

struct OptionalFieldHandler {
    
    static func handle<T: Codable>(_ field: T?,
                                   validation validate: ((T) -> Bool) = { _ in return true},
                                   defaultValue: T) -> T {
        
        guard let existingField = field, validate(existingField) else {
            return defaultValue
        }
        
        return existingField
        
    }
    
}
