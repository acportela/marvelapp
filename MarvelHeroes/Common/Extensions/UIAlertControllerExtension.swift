//
//  UIAlertControllerExtension.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

extension UIAlertController {
    convenience init(title: String,
                     message: String,
                     positiveActionTitle: String,
                     handler: ((UIAlertAction) -> Void)? = nil) {
        
        self.init(title: title,
                  message: message,
                  preferredStyle: UIAlertController.Style.alert)
        
        let positiveAction = UIAlertAction(title: positiveActionTitle,
                                           style: .default,
                                           handler: handler)
        addAction(positiveAction)
        
    }
}
