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
    let results: [T]
}

struct Character: Codable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
        
        let name = try? container.decode(String.self, forKey: .name)
        let description = try? container.decode(String.self, forKey: .description)
        
        self.name = OptionalFieldHandler.handle(name,
                                                validation: { name in !name.isEmpty},
                                                defaultValue: "Unknown")
        self.description = OptionalFieldHandler.handle(description,
                                                       validation: { description in !description.isEmpty},
                                                       defaultValue: "Not Present")
        
    }
    
}

struct CharacterMaterial: Codable {
    
    let title: String?
    let description: String?
    let variantDescription: String?
    
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

struct Thumbnail: Codable {
    
    let path: String?
    let pathExtension: String?
    
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

struct OptionalFieldHandler {
    
    static func handle<T: Codable>(_ field: T?,
                                   validation validate: ((T) -> Bool) = { _ in return true},
                                   defaultValue: T) -> T {
        
        guard let existingField = field, validate(existingField) else {
            return defaultValue
        }
        
        return existingField
        
    }
    
}
