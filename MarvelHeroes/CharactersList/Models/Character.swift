//
//  Character.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
    }
    
}
