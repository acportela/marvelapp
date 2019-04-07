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
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private let heart: UIButton = {
        let button = UIButton()
        button.tintColor = Resources.Colors.red
        let selected = Resources.Images.favoriteIconFilled
        let unselected = Resources.Images.favoriteIconOutlined
        button.setBackgroundImage(selected, for: .selected)
        button.setBackgroundImage(unselected, for: .normal)
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
    
    func startActivityIndicator() {
        if activityIndicator.isAnimating { return }
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
}

extension CharacterDetailsView: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(image)
        contentView.addSubview(heart)
        contentView.addSubview(tableView)
        contentView.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin).offset(16)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin).inset(16)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).inset(16)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(240)
        }
        
        heart.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(16)
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
        tableView.backgroundColor = Resources.Colors.black
        activityIndicator.isHidden = true
        heart.addTarget(self, action: #selector(heartWasTouched), for: .touchUpInside)
    }
    
}

extension CharacterDetailsView {
    
    public struct Configuration {
        let isFavorite: Bool
        let image: Thumbnail
    }
    
    public func setup(with config: Configuration) {
        image.download(image: config.image.fullPath)
        heart.isSelected = config.isFavorite
    }
    
}

extension CharacterDetailsView {
    
    @objc
    func heartWasTouched() {
        heart.isSelected = !heart.isSelected
        characterWasFavorited?(heart.isSelected)
    }
    
}
