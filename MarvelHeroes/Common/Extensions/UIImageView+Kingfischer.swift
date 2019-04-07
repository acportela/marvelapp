//
//  UIImageView+Kingfischer.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func download(image url: String) {
        let url = URL(string: url)
        self.kf.setImage(with: url)
    }
}
