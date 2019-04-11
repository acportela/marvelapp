//
//  Errors.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

enum Errors: Error {
    
    case parsing
    case connectivity
    case authentication
    case malformedURL
    case unknown
    
    var message: String {
        switch self {
        case .connectivity:
            return "Please check your connection and try again"
        case .malformedURL:
            return "Special characters are not allowed. Please remove them and try again"
        default:
            return "An error occured. Please try again"
        }
    }
    
    var title: String {
        switch self {
        case .connectivity:
            return "Connection"
        case .malformedURL:
            return "Special Characters"
        default:
            return "Oops"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .malformedURL:
            return "Ok"
        default:
            return "Try Again"
        }
    }
    
    var secodaryButtonTitle: String? {
        switch self {
        case .connectivity, .malformedURL:
            return nil
        default:
            return "Cancel"
        }
    }
    
}
