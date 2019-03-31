//
//  CharactersResponse.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let code: Int
    let data: Content<T>
}

struct Content<T: Decodable>: Decodable {
    let results: [T]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let description: String?
    let thumbnail: Thumbnail?
}

struct CharacterMaterial: Decodable {
    let title: String
    let description: String?
    let variantDescription: String?
}

struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
