//
//  CharacterMaterialCell.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 4/5/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharacterMaterialCell: UITableViewCell {
    
    private let name: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.numberOfLines = 0
        name.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        name.textColor = Resources.Colors.white
        return name
    }()
    
    private let about: UILabel = {
        let about =  UILabel()
        about.textAlignment = .left
        about.numberOfLines = 0
        about.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        about.textColor = Resources.Colors.white
        return about
    }()
    
    static func height() -> CGFloat {
        return 96
    }
    
    private let container = UIView()
    
    public init(frame: CGRect) {
        super.init(style: .default, reuseIdentifier: type(of: self).reusableIdentifier)
        self.frame = frame
        setupViewConfiguration()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConfiguration()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
}

extension CharacterMaterialCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(container)
        container.addSubview(name)
        container.addSubview(about)
    }
    
    func setupConstraints() {
        
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
        }
        
        name.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        
        about.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.greaterThanOrEqualTo(name.snp.bottom).offset(8)
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.black
        selectionStyle = .none
    }
    
}

extension CharacterMaterialCell: Reusable { }

extension CharacterMaterialCell {
    
    public struct Configuration {
        let name: String
        let description: String
    }
    
    public func setup(with config: Configuration) {
        name.text = config.name
        about.text = config.description
    }
    
}
