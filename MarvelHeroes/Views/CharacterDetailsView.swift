//
//  CharacterDetailsView.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit

final class CharacterDetailsView: UIView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        return view
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let name: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        name.textColor = Resources.Colors.lightRed
        return name
    }()
    
    private let contentView = UIView()
    
    override init(frame: CGRect = .zero) {
        
        super.init(frame: frame)
        
        setupViewConfiguration()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Use view coding to initialize view")
    }
    
}

extension CharacterDetailsView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.right.bottom.equalToSuperview().inset(8)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(self.bounds.height/3)
        }
        
        name.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.top.equalTo(image.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.black
    }
    
}

extension CharacterDetailsView {
    
    public struct Configuration {
        let name: String
        let image: ImagePath
    }
    
    public func setup(with config: Configuration) {
        name.text = config.name
        image.download(image: config.image.fullPath)
    }
    
}
