//
//  FavoriteCharactersStorage.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct FavoriteCharacters: Codable {
    init(ids: Set<Int>) {
        self.ids = ids
    }
    var ids: Set<Int>
}

class FavoriteCharactersStorage: StorageProtocol {
    
    func get(from key: StorageKeys = .favorites) -> FavoriteCharacters? {
        guard let object = UserDefaults.standard.object(forKey: key.rawValue),
            let data = object as? Data else {
                return nil
        }
        let unarchiver = NSKeyedUnarchiver.init(forReadingWith: data)
        return unarchiver.decodeDecodable(FavoriteCharacters.self,
                                          forKey: StorageKeys.favorites.rawValue)
    }
    
    func set(_ value: FavoriteCharacters, for key: StorageKeys = .favorites) {
        let archiver = NSKeyedArchiver()
        try? archiver.encodeEncodable(value, forKey: key.rawValue)
        UserDefaults.standard.set(archiver.encodedData, forKey: key.rawValue)
    }
    
}
