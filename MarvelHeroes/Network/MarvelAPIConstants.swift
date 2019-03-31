//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Keys
import CryptoSwift

struct MarvelAPIConstants {
    
    static var baseURL = URL(string: "https://gateway.marvel.com:443/v1/")!
    private static let keys = MarvelHeroesKeys()
    private static let privatekey = keys.marvelPrivateKey
    private static let publicKey = keys.marvelPublicKey
    //TODO - Check if it changes properly over time
    private static let stamp = Date().timeIntervalSince1970.description
    private static let hash = "\(stamp)\(privatekey)\(publicKey)".md5()
    
    //https://gateway.marvel.com:443/v1/public/characters?name=spider-man&limit=20&apikey=23948sodasodi4asd
    
}

enum MarvelEndpoints {
    
    case characters(String?)
    case comics(String)
    case events(String)
    case series(String)
    case stories(String)
    
    var path: String {
        switch self {
        case .characters:
            return "public/characters?"
        case .comics(let id):
            return "public/characters/\(id)/comics?"
        case .events(let id):
            return "public/characters/\(id)/events?"
        case .series(let id):
            return "public/characters/\(id)/series?"
        case .stories(let id):
            return "public/characters/\(id)/stories?"
        }
    }
    
}
