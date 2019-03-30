//
//  ImagePath.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

struct ImagePath {
    
    let path: String
    let fileExtension: String
    
    var fullPath: String {
        return "\(path).\(fileExtension)"
    }
    
}
