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
