//
//  ResponseError.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum ResponseError: Error {
    
    case parsing
    case connectivity
    case authentication
    case unknown
    
    var message: String {
        switch self {
        case .connectivity:
            return "Please check your connection and try again"
        case .parsing, .authentication, .unknown:
            return "An error occured. Please try again"
        }
    }
    
    var title: String {
        switch self {
        case .connectivity:
            return "Connection"
        case .parsing, .authentication, .unknown:
            return "Oops"
        }
    }
    
    var buttonTitle: String {
        return "Try Again"
    }
    
}
