//
//  MaterialKind.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum MaterialKind {
    case comics(Int)
    case stories(Int)
    case events(Int)
    case series(Int)
    
    var endpoint: MarvelEndpoints {
        switch self {
        case .comics(let id):
            return .comics(id)
        case .events(let id):
            return .events(id)
        case .series(let id):
            return .series(id)
        case .stories(let id):
            return .stories(id)
        }
    }
}
