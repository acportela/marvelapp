//
//  CharacterTableViewCell.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class CharacterTableViewCell: UITableViewCell {
    
    private let thumb: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private let name: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        name.adjustsFontSizeToFitWidth = true
        name.minimumScaleFactor = 0.9
        name.lineBreakMode = .byClipping
        name.textColor = Resources.Colors.white
        return name
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
    
    private let about: UILabel = {
        let about =  UILabel()
        about.textAlignment = .justified
        about.numberOfLines = 0
        about.font = UIFont.systemFont(ofSize: 13, weight: .light)
        about.textColor = Resources.Colors.white
        return about
    }()
    
    private let content = UIView()
    
    var characterWasFavorited: ((Bool) -> Void)?
    
    static func height() -> CGFloat {
        return 96
    }
    
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

extension CharacterTableViewCell: ViewCodingProtocol {
    
    func buildViewHierarchy() {
        addSubview(content)
        content.addSubview(thumb)
        content.addSubview(heart)
        content.addSubview(name)
        content.addSubview(about)
    }
    
    func setupConstraints() {
        
        content.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8)
            make.right.bottom.equalToSuperview().inset(8)
        }
        
        thumb.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        heart.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.right.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }

        about.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(8)
            make.left.equalTo(thumb.snp.right).offset(16)
            make.right.equalTo(heart.snp.left).offset(-16)
            make.bottom.lessThanOrEqualToSuperview().inset(8)
        }

        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(thumb.snp.right).offset(16)
            make.right.equalTo(heart.snp.left).offset(-16)
        }
        
    }
    
    func configureViews() {
        selectionStyle = .none
        backgroundColor = Resources.Colors.black
        heart.addTarget(self, action: #selector(heartWasTouched), for: .touchUpInside)
    }
    
}

extension CharacterTableViewCell {
    
    public struct Configuration {
        let name: String
        let about: String
        let isFavorite: Bool
        let image: Thumbnail
    }
    
    public func setup(with config: Configuration) {
        name.text = config.name
        about.text = config.about
        thumb.download(image: config.image.fullPath)
        heart.isSelected = config.isFavorite
    }
    
}

extension CharacterTableViewCell: Reusable { }

extension CharacterTableViewCell {
    
    @objc
    func heartWasTouched() {
        characterWasFavorited?(heart.isSelected)
    }
    
}
