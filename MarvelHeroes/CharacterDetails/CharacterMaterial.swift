//
//  CharacterMaterial.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/31/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct CharacterMaterial: Codable {
    
    let title: String
    let description: String
    let variantDescription: String
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let title = try? container.decode(String.self, forKey: .title)
        let description = try? container.decode(String.self, forKey: .description)
        let varDescription = try? container.decode(String.self, forKey: .variantDescription)
        
        self.title = OptionalFieldHandler.handle(title,
                                                 validation: { title in !title.isEmpty},
                                                 defaultValue: "Unknown")
        self.description = OptionalFieldHandler.handle(description,
                                                       validation: { description in !description.isEmpty},
                                                       defaultValue: "Not Present")
        self.variantDescription = OptionalFieldHandler.handle(varDescription,
                                                              validation: { varDescription in !varDescription.isEmpty},
                                                              defaultValue: "Not Present")
        
    }
    
}
