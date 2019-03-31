//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum MarvelEndpoints {
    
    case characters
    case comics(String)
    case events(String)
    case series(String)
    case stories(String)
    
    var path: String {
        switch self {
        case .characters:
            return "public/characters"
        case .comics(let id):
            return "public/characters/\(id)/comics"
        case .events(let id):
            return "public/characters/\(id)/events"
        case .series(let id):
            return "public/characters/\(id)/series"
        case .stories(let id):
            return "public/characters/\(id)/stories"
        }
    }
    
}
