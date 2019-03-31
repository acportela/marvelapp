//
//  Result.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Errors)
}

enum Errors: Error {
    case parsing
    case connectivity
    case authentication
}
