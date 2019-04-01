//
//  Resources.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

enum Resources {
    
    enum Colors {}
    enum Images {}
    
}

extension Resources.Colors {
    
    static let red =  UIColor(red: 195, green: 66, blue: 63)
    //static let lightRed =  UIColor(red: 250, green: 116, blue: 125)
    static let white =  UIColor(red: 255, green: 255, blue: 255)
    static let black =  UIColor(red: 81, green: 59, blue: 65)
    
}

extension Resources.Images {
    
    static let favoriteIconFilled = UIImage(named: "favorite_full_icon")
    static let favoriteIconOutlined = UIImage(named: "favorite_empty_icon")
    
}
