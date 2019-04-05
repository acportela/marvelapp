//
//  Thumbnail.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    
    let path: String
    let pathExtension: String
    
    var fullPath: String {
        return "\(path).\(pathExtension)"
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case pathExtension = "extension"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let path = try? container.decode(String.self, forKey: .path)
        let pathExtension = try? container.decode(String.self, forKey: .pathExtension)
        
        self.path = OptionalFieldHandler.handle(path,
                                                validation: { path in !path.isEmpty},
                                                defaultValue: "")
        self.pathExtension = OptionalFieldHandler.handle(pathExtension,
                                                         validation: { pathExtension in !pathExtension.isEmpty},
                                                         defaultValue: "")
        
    }
    
}
