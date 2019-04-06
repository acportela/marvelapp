//
//  CharacterMaterialHeaderView.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharacterMaterialHeaderView: UIView {
    
    private let name: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        name.textColor = Resources.Colors.red
        return name
    }()
    
    static func height() -> CGFloat {
        return 30
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension CharacterMaterialHeaderView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(name)
    }
    
    func setupConstraints() {
        name.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.black
    }
    
}

extension CharacterMaterialHeaderView {
    
    public struct Configuration {
        let name: String
    }
    
    public func setup(with config: Configuration) {
        name.text = config.name
    }
    
}
