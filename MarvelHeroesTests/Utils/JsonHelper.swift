//
//  JsonHelper.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
@testable import MarvelHeroes

struct JsonHelper {
    
    func dataFromFile(_ file: String,
                      withExtension fileExt: String = "json",
                      andContext context: AnyClass) -> Data {
        
        guard let url = Bundle(for: context).url(forResource: file, withExtension: fileExt) else {
            fatalError("Could not build url for given class and file")
        }
        
        guard let dataFromFile = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from file named \(file)")
        }
        
        return dataFromFile
    }
    
    func parse<T: Decodable>(dataType: T.Type = T.self,
                             from data: Data) -> T {
        do {
            return try JSONDecoder().decode(dataType, from: data)
        } catch {
            fatalError("Failed to parse decodable")
        }
    }
    
}
