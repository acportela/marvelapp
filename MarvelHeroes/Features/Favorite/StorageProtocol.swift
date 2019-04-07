//
//  StorageProtocol.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum StorageKeys: String {
    case favorites
}

protocol StorageProtocol {
    associatedtype Object: Codable
    func get(from key: StorageKeys) -> Object?
    func set(_ value: Object, for key: StorageKeys)
}
