//
//  CharacterMaterial.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct CharacterMaterial: Codable {
    
    let title: String
    let description: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = (try? container.decode(String.self, forKey: .title)) ?? "Unknown"
        self.description = (try? container.decode(String.self, forKey: .description)) ?? "Not Available"
    }
    
}

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
