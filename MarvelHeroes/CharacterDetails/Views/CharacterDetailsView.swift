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
        view.allowsSelection = false
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
        name.textColor = Resources.Colors.white
        return name
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private let heart: UIButton = {
        let button = UIButton()
        button.tintColor = Resources.Colors.red
        let selected = Resources.Images.favoriteIconFilled
        let unselected = Resources.Images.favoriteIconOutlined
        button.setImage(selected, for: .selected)
        button.setImage(unselected, for: .normal)
        return button
    }()
    
    var characterWasFavorited: ((Bool) -> Void)?
    
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
        contentView.addSubview(heart)
        contentView.addSubview(name)
        contentView.addSubview(tableView)
        contentView.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(8)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(8)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(8)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).inset(8)
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
        
        heart.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(name.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(heart.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(heart.snp.bottom).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.center.equalToSuperview()
        }
        
    }
    
    func configureViews() {
        backgroundColor = Resources.Colors.black
        activityIndicator.isHidden = true
        heart.addTarget(self, action: #selector(heartWasTouched), for: .touchUpInside)
    }
    
}

extension CharacterDetailsView {
    
    public struct Configuration {
        let name: String
        let isFavorite: Bool
        let image: Thumbnail
    }
    
    public func setup(with config: Configuration) {
        name.text = config.name
        image.download(image: config.image.fullPath)
        heart.isSelected = config.isFavorite
    }
    
}

extension CharacterDetailsView {
    
    @objc
    func heartWasTouched() {
        characterWasFavorited?(heart.isSelected)
    }
    
}
