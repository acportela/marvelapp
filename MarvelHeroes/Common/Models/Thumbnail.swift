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
    
    public init(path: String = "", pathExtension: String = "") {
        self.path = path
        self.pathExtension = pathExtension
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.path = (try? container.decode(String.self, forKey: .path)) ?? ""
        self.pathExtension = (try? container.decode(String.self, forKey: .pathExtension)) ?? ""
    }
    
}
