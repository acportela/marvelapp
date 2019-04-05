//
//  FavoriteCharactersStorage.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum FileNames: String {
    case favorites
}

struct FavoriteCharacters: Codable {
    var ids: Set<Int>
}

struct FavoriteCharactersStorage: StorageProtocol {
    
    var path: URL {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return url.appendingPathComponent(FileNames.favorites.rawValue)
    }
    
    func save(_ object: FavoriteCharacters) throws {
        NSKeyedArchiver.archiveRootObject(object, toFile: path.path)
    }
    
    func load() -> FavoriteCharacters? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: path.path) as? FavoriteCharacters
    }
    
}
