//
//  StorageProtocol.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

protocol StorageProtocol {
    
    associatedtype Object: Codable
    
    var path: URL { get }
    
    func save(_ object: Object) throws
    
    func load() -> Object?
    
}
